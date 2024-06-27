#Install Packages
install.packages("pROC")
install.packages("caret")
library(keras)
library(caret)
library(glmnet)
library(pROC)

# Load the trained CNN model
model <- load_model_keras("my_model.keras")

# Create a new model that outputs the features from the correct layer
feature_extractor <- keras_model(inputs = model$input, outputs = get_layer(model, "dense_23")$output)

# Extract features from the training, validation, and test data
train_features <- predict(feature_extractor, train_images)
val_features <- predict(feature_extractor, val_images)
test_features <- predict(feature_extractor, test_images)

# Feature selection using Lasso (L1 regularization)
lasso_model <- cv.glmnet(train_features, train_labels, alpha = 1)
selected_features <- which(coef(lasso_model, s = "lambda.min") != 0)[-1] # exclude intercept

# Use selected features
train_features_selected <- train_features[, selected_features]
val_features_selected <- val_features[, selected_features]
test_features_selected <- test_features[, selected_features]

# Load the logistic regression model
loaded_model <- readRDS("trained_logistic_model.rds")

# Predict using the logistic regression model with selected features
train_predictions <- predict(loaded_model, train_features_selected, type = "response")
val_predictions <- predict(loaded_model, val_features_selected, type = "response")
test_predictions <- predict(loaded_model, test_features_selected, type = "response")

# Convert predictions to binary labels (0 or 1)
train_pred_labels <- ifelse(train_predictions > 0.5, 1, 0)
val_pred_labels <- ifelse(val_predictions > 0.5, 1, 0)
test_pred_labels <- ifelse(test_predictions > 0.5, 1, 0)

#Binary labels for comparison
train_labels_binary <- train_labels
val_labels_binary <- val_labels
test_labels_binary <- test_labels

# Evaluate the combined model
train_accuracy <- mean(train_pred_labels == train_labels_binary)
val_accuracy <- mean(val_pred_labels == val_labels_binary)
test_accuracy <- mean(test_pred_labels == test_labels_binary)

cat("Train Accuracy:", train_accuracy, "\n")
cat("Validation Accuracy:", val_accuracy, "\n")
cat("Test Accuracy:", test_accuracy, "\n")

# Calculate ROC-AUC score
train_roc_auc <- roc(train_labels_binary, train_predictions)
val_roc_auc <- roc(val_labels_binary, val_predictions)
test_roc_auc <- roc(test_labels_binary, test_predictions)

cat("Train ROC-AUC:", auc(train_roc_auc), "\n")
cat("Validation ROC-AUC:", auc(val_roc_auc), "\n")
cat("Test ROC-AUC:", auc(test_roc_auc), "\n")

# Plot ROC curves
plot(test_roc_auc, col = "red", add = TRUE)

legend("bottomright", legend = c("Multimodal ROC"), col = c("orange"), lwd = 2)

# Performance metrics
train_metrics <- data.frame(
  Accuracy = train_conf_matrix$overall["Accuracy"]
)
val_metrics <- data.frame(
  Accuracy = val_conf_matrix$overall["Accuracy"]
)
test_metrics <- data.frame(
  Accuracy = test_conf_matrix$overall["Accuracy"]
)
cat("Train Performance Metrics:\n")
print(train_metrics)
cat("Validation Performance Metrics:\n")
print(val_metrics)
cat("Test Performance Metrics:\n")
print(test_metrics)
