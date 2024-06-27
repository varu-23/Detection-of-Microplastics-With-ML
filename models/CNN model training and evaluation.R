#Install Packages
install.packages("gridExtra")
install.packages("ggplot2")


library(reticulate)
use_virtualenv("~/myenv", required = TRUE)
library(tensorflow)
library(keras)
library(gridExtra)
library(ggplot2)

# Define the model 
model <- keras_model_sequential() %>% 
  layer_conv_2d(filters = 32, kernel_size = c(3, 3), activation = 'relu', input_shape = c(128, 128, 3)) %>% 
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_conv_2d(filters = 64, kernel_size = c(3, 3), activation = 'relu') %>% 
  layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
  layer_flatten() %>% 
  layer_dense(units = 128, activation = 'relu') %>% 
  layer_dense(units = 1, activation = 'sigmoid')

# Single neuron for binary classification 
# Use the legacy Adam optimizer with learning_rate 
optimizer <- tf$keras$optimizers$legacy$Adam(learning_rate = 0.001)

# Compile the model 
model %>% compile(
  loss = "binary_crossentropy", 
  optimizer = optimizer, 
  metrics = "accuracy"
)

# Fit the model with binary labels 
history <- model %>% fit(
  train_images, train_labels_binary, 
  epochs = 20, 
  batch_size = 32, 
  validation_data = list(val_images, val_labels_binary)
)

# Save the model 
model %>% save_model_keras("my_model.keras")

# Evaluate the model on test data 
evaluation <- model %>% evaluate(test_images, test_labels_binary)
cat("Test Loss:", evaluation[[1]], "\n")
cat("Test Accuracy:", evaluation[[2]], "\n")

# Make predictions 
predictions <- model %>% predict(test_images)
predicted_labels <- ifelse(predictions > 0.5, 1, 0)

# Convert predictions and true labels to factors 
predicted_labels <- as.factor(predicted_labels)
true_labels <- as.factor(test_labels_binary)

# Plot the learning curves 
plot(history)

# Display test images with predicted labels
display_images <- function(images, predictions, true_labels, n = 9) {
  indices <- sample(1:length(predictions), n)
  plot_list <- list()
  
  for (i in indices) {
    img <- array_reshape(images[i, , , ], c(128, 128, 3))
    pred <- predictions[i]
    true_label <- ifelse(true == 1, "Microplastics", "No Microplastics")
    pred_label <- ifelse(pred == 1, "Microplastics", "No Microplastics")
    title <- paste("True:", true_label, "- Pred:", pred_label)
    
    p <- ggplot() + 
      annotation_raster(img, xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf) + 
      ggtitle(title) + 
      theme_minimal() + 
      theme(
        plot.title = element_text(size = 10),
        axis.title = element_blank(),
        axis.text = element_blank(),`
        axis.ticks = element_blank()
      )
    
    plot_list[[length(plot_list) + 1]] <- p
  }
  
  do.call("grid.arrange", c(plot_list, ncol = 3))
}

# Call the function to display images
display_images(test_images, predicted_labels, true_labels, n = 9)
