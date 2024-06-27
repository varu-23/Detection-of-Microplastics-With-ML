# Ensure consistent factor levels
train_data$microplastics <- factor(train_data$microplastics, levels = c("0", "1"))
val_data$microplastics <- factor(val_data$microplastics, levels = c("0", "1"))
test_data$microplastics <- factor(test_data$microplastics, levels = c("0", "1"))

# Load necessary packages
if (!requireNamespace("caret", quietly = TRUE)) install.packages("caret")
if (!requireNamespace("glmnet", quietly = TRUE)) install.packages("glmnet")
if (!requireNamespace("magick", quietly = TRUE)) install.packages("magick")

library(caret)
library(glmnet)
library(magick)

# Define the cross-validation method
train_control <- trainControl(method = "cv", number = 10)

# Grid search for hyperparameters
grid <- expand.grid(
  alpha = c(0, 1), # 0 for Ridge, 1 for LASSO
  lambda = seq(0.001, 0.1, by = 0.01) # Range of lambda values
)

# Train the model with cross-validation
set.seed(123) # For reproducibility
logistic_model <- train(
  microplastics ~ ., 
  data = train_data,
  method = "glmnet",
  trControl = train_control,
  tuneGrid = grid,
  family = "binomial"
)

# Print the best model
print(logistic_model$bestTune)

# Predict on validation set
val_predictions <- predict(logistic_model, newdata = val_data, type = "prob")[, 2]
val_pred_classes <- ifelse(val_predictions > 0.5, "1", "0")

# Ensure predictions are factors with same levels
val_pred_classes <- factor(val_pred_classes, levels = c("0", "1"))

# Evaluate on validation set
val_conf_matrix <- confusionMatrix(val_pred_classes, val_data$microplastics)
print(val_conf_matrix)

# Predict on test set
test_predictions <- predict(logistic_model, newdata = test_data, type = "prob")[, 2]
test_pred_classes <- ifelse(test_predictions > 0.5, "1", "0")

# Ensure predictions are factors with same levels
test_pred_classes <- factor(test_pred_classes, levels = c("0", "1"))

# Evaluate on test set
test_conf_matrix <- confusionMatrix(test_pred_classes, test_data$microplastics)
print(test_conf_matrix)

# Ensure consistent factor levels
train_data$microplastics <- factor(train_data$microplastics, levels = c("0", "1"))
val_data$microplastics <- factor(val_data$microplastics, levels = c("0", "1"))
test_data$microplastics <- factor(test_data$microplastics, levels = c("0", "1"))

# Load necessary packages
if (!requireNamespace("caret", quietly = TRUE)) install.packages("caret")
if (!requireNamespace("glmnet", quietly = TRUE)) install.packages("glmnet")
if (!requireNamespace("magick", quietly = TRUE)) install.packages("magick")

library(caret)
library(glmnet)
library(magick)

# Define the cross-validation method
train_control <- trainControl(method = "cv", number = 10)

# Grid search for hyperparameters
grid <- expand.grid(
  alpha = c(0, 1), # 0 for Ridge, 1 for LASSO
  lambda = seq(0.001, 0.1, by = 0.01) # Range of lambda values
)

# Train the model with cross-validation
set.seed(123) # For reproducibility
logistic_model <- train(
  microplastics ~ ., 
  data = train_data,
  method = "glmnet",
  trControl = train_control,
  tuneGrid = grid,
  family = "binomial"
)

# Print the best model
print(logistic_model$bestTune)

# Predict on validation set
val_predictions <- predict(logistic_model, newdata = val_data, type = "prob")[, 2]
val_pred_classes <- ifelse(val_predictions > 0.5, "1", "0")

# Ensure predictions are factors with same levels
val_pred_classes <- factor(val_pred_classes, levels = c("0", "1"))

# Evaluate on validation set
val_conf_matrix <- confusionMatrix(val_pred_classes, val_data$microplastics)
print(val_conf_matrix)

# Predict on test set
test_predictions <- predict(logistic_model, newdata = test_data, type = "prob")[, 2]
test_pred_classes <- ifelse(test_predictions > 0.5, "1", "0")

# Ensure predictions are factors with same levels
test_pred_classes <- factor(test_pred_classes, levels = c("0", "1"))

# Evaluate on test set
test_conf_matrix <- confusionMatrix(test_pred_classes, test_data$microplastics)
print(test_conf_matrix)

# Load the trained model from file
loaded_model <- readRDS("trained_logistic_model.rds")
