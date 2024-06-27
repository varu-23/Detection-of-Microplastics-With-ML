# Load the existing data file
combined_data <- read.csv('dataset.csv')

# Column to indicate the presence of microplastics (1 for existing data with microplastics)
combined_data$microplastics <- 1

# Generate synthetic data 
set.seed(123)  # For reproducibility
num_synthetic_samples <- 100  # Number of synthetic healthy samples to generate

# Generate synthetic values for each column
synthetic_s.area <- runif(num_synthetic, min = min(combined_data$s.area, na.rm = TRUE), max = max(combined_data$s.area, na.rm = TRUE))
synthetic_s.perimeter <- runif(num_synthetic, min = min(combined_data$s.perimeter, na.rm = TRUE), max = max(combined_data$s.perimeter, na.rm = TRUE))
synthetic_s.radius.mean <- runif(num_synthetic, min = min(combined_data$s.radius.mean, na.rm = TRUE), max = max(combined_data$s.radius.mean, na.rm = TRUE))
synthetic_s.radius.sd <- runif(num_synthetic, min = min(combined_data$s.radius.sd, na.rm = TRUE), max = max(combined_data$s.radius.sd, na.rm = TRUE))
synthetic_s.radius.min <- runif(num_synthetic, min = min(combined_data$s.radius.min, na.rm = TRUE), max = max(combined_data$s.radius.min, na.rm = TRUE))
synthetic_s.radius.max <- runif(num_synthetic, min = min(combined_data$s.radius.max, na.rm = TRUE), max = max(combined_data$s.radius.max, na.rm = TRUE))
synthetic_m.cx <- runif(num_synthetic, min = min(combined_data$m.cx, na.rm = TRUE), max = max(combined_data$m.cx, na.rm = TRUE))
synthetic_m.cy <- runif(num_synthetic, min = min(combined_data$m.cy, na.rm = TRUE), max = max(combined_data$m.cy, na.rm = TRUE))
synthetic_m.majoraxis <- runif(num_synthetic, min = min(combined_data$m.majoraxis, na.rm = TRUE), max = max(combined_data$m.majoraxis, na.rm = TRUE))
synthetic_m.eccentricity <- runif(num_synthetic, min = min(combined_data$m.eccentricity, na.rm = TRUE), max = max(combined_data$m.eccentricity, na.rm = TRUE))
synthetic_m.theta <- runif(num_synthetic, min = min(combined_data$m.theta, na.rm = TRUE), max = max(combined_data$m.theta, na.rm = TRUE))
synthetic_h.asm.s1 <- runif(num_synthetic, min = min(combined_data$h.asm.s1, na.rm = TRUE), max = max(combined_data$h.asm.s1, na.rm = TRUE))
synthetic_h.con.s1 <- runif(num_synthetic, min = min(combined_data$h.con.s1, na.rm = TRUE), max = max(combined_data$h.con.s1, na.rm = TRUE))
synthetic_h.cor.s1 <- runif(num_synthetic, min = min(combined_data$h.cor.s1, na.rm = TRUE), max = max(combined_data$h.cor.s1, na.rm = TRUE))
synthetic_h.var.s1 <- runif(num_synthetic, min = min(combined_data$h.var.s1, na.rm = TRUE), max = max(combined_data$h.var.s1, na.rm = TRUE))
synthetic_h.idm.s1 <- runif(num_synthetic, min = min(combined_data$h.idm.s1, na.rm = TRUE), max = max(combined_data$h.idm.s1, na.rm = TRUE))
synthetic_h.sav.s1 <- runif(num_synthetic, min = min(combined_data$h.sav.s1, na.rm = TRUE), max = max(combined_data$h.sav.s1, na.rm = TRUE))
synthetic_h.sva.s1 <- runif(num_synthetic, min = min(combined_data$h.sva.s1, na.rm = TRUE), max = max(combined_data$h.sva.s1, na.rm = TRUE))
synthetic_h.sen.s1 <- runif(num_synthetic, min = min(combined_data$h.sen.s1, na.rm = TRUE), max = max(combined_data$h.sen.s1, na.rm = TRUE))
synthetic_h.ent.s1 <- runif(num_synthetic, min = min(combined_data$h.ent.s1, na.rm = TRUE), max = max(combined_data$h.ent.s1, na.rm = TRUE))
synthetic_h.dva.s1 <- runif(num_synthetic, min = min(combined_data$h.dva.s1, na.rm = TRUE), max = max(combined_data$h.dva.s1, na.rm = TRUE))
synthetic_h.den.s1 <- runif(num_synthetic, min = min(combined_data$h.den.s1, na.rm = TRUE), max = max(combined_data$h.den.s1, na.rm = TRUE))
synthetic_h.f12.s1 <- runif(num_synthetic, min = min(combined_data$h.f12.s1, na.rm = TRUE), max = max(combined_data$h.f12.s1, na.rm = TRUE))
synthetic_h.f13.s1 <- runif(num_synthetic, min = min(combined_data$h.f13.s1, na.rm = TRUE), max = max(combined_data$h.f13.s1, na.rm = TRUE))
synthetic_h.asm.s2 <- runif(num_synthetic, min = min(combined_data$h.asm.s2, na.rm = TRUE), max = max(combined_data$h.asm.s2, na.rm = TRUE))
synthetic_h.con.s2 <- runif(num_synthetic, min = min(combined_data$h.con.s2, na.rm = TRUE), max = max(combined_data$h.con.s2, na.rm = TRUE))
synthetic_h.cor.s2 <- runif(num_synthetic, min = min(combined_data$h.cor.s2, na.rm = TRUE), max = max(combined_data$h.cor.s2, na.rm = TRUE))
synthetic_h.var.s2 <- runif(num_synthetic, min = min(combined_data$h.var.s2, na.rm = TRUE), max = max(combined_data$h.var.s2, na.rm = TRUE))
synthetic_h.idm.s2 <- runif(num_synthetic, min = min(combined_data$h.idm.s2, na.rm = TRUE), max = max(combined_data$h.idm.s2, na.rm = TRUE))
synthetic_h.sav.s2 <- runif(num_synthetic, min = min(combined_data$h.sav.s2, na.rm = TRUE), max = max(combined_data$h.sav.s2, na.rm = TRUE))
synthetic_h.sva.s2 <- runif(num_synthetic, min = min(combined_data$h.sva.s2, na.rm = TRUE), max = max(combined_data$h.sva.s2, na.rm = TRUE))
synthetic_h.sen.s2 <- runif(num_synthetic, min = min(combined_data$h.sen.s2, na.rm = TRUE), max = max(combined_data$h.sen.s2, na.rm = TRUE))
synthetic_h.ent.s2 <- runif(num_synthetic, min = min(combined_data$h.ent.s2, na.rm = TRUE), max = max(combined_data$h.ent.s2, na.rm = TRUE))
synthetic_h.dva.s2 <- runif(num_synthetic, min = min(combined_data$h.dva.s2, na.rm = TRUE), max = max(combined_data$h.dva.s2, na.rm = TRUE))
synthetic_h.den.s2 <- runif(num_synthetic, min = min(combined_data$h.den.s2, na.rm = TRUE), max = max(combined_data$h.den.s2, na.rm = TRUE))
synthetic_h.f12.s2 <- runif(num_synthetic, min = min(combined_data$h.f12.s2, na.rm = TRUE), max = max(combined_data$h.f12.s2, na.rm = TRUE))
synthetic_h.f13.s2 <- runif(num_synthetic, min = min(combined_data$h.f13.s2, na.rm = TRUE), max = max(combined_data$h.f13.s2, na.rm = TRUE))
synthetic_Wavelength <- runif(num_synthetic, min = min(combined_data$Wavelength, na.rm = TRUE), max = max(combined_data$Wavelength, na.rm = TRUE))
synthetic_X.Transmittance <- runif(num_synthetic, min = min(combined_data$X.Transmittance, na.rm = TRUE), max = max(combined_data$X.Transmittance, na.rm = TRUE))

# Create Sample column with "synthetic" values
synthetic_sample <- rep("synthetic", num_synthetic)

# Combine columns into synthetic data frame
synthetic_data <- data.frame(
  Sample = synthetic_sample,
  image_name.x = synthetic_image_names,
  s.area = synthetic_s.area,
  s.perimeter = synthetic_s.perimeter,
  s.radius.mean = synthetic_s.radius.mean,
  s.radius.sd = synthetic_s.radius.sd,
  s.radius.min = synthetic_s.radius.min,
  s.radius.max = synthetic_s.radius.max,
  m.cx = synthetic_m.cx,
  m.cy = synthetic_m.cy,
  m.majoraxis = synthetic_m.majoraxis,
  m.eccentricity = synthetic_m.eccentricity,
  m.theta = synthetic_m.theta,
  h.asm.s1 = synthetic_h.asm.s1,
  h.con.s1 = synthetic_h.con.s1,
  h.cor.s1 = synthetic_h.cor.s1,
  h.var.s1 = synthetic_h.var.s1,
  h.idm.s1 = synthetic_h.idm.s1,
  h.sav.s1 = synthetic_h.sav.s1,
  h.sva.s1 = synthetic_h.sva.s1,
  h.sen.s1 = synthetic_h.sen.s1,
  h.ent.s1 = synthetic_h.ent.s1,
  h.dva.s1 = synthetic_h.dva.s1,
  h.den.s1 = synthetic_h.den.s1,
  h.f12.s1 = synthetic_h.f12.s1,
  h.f13.s1 = synthetic_h.f13.s1,
  h.asm.s2 = synthetic_h.asm.s2,
  h.con.s2 = synthetic_h.con.s2,
  h.cor.s2 = synthetic_h.cor.s2,
  h.var.s2 = synthetic_h.var.s2,
  h.idm.s2 = synthetic_h.idm.s2,
  h.sav.s2 = synthetic_h.sav.s2,
  h.sva.s2 = synthetic_h.sva.s2,
  h.sen.s2 = synthetic_h.sen.s2,
  h.ent.s2 = synthetic_h.ent.s2,
  h.dva.s2 = synthetic_h.dva.s2,
  h.den.s2 = synthetic_h.den.s2,
  h.f12.s2 = synthetic_h.f12.s2,
  h.f13.s2 = synthetic_h.f13.s2,
  Wavelength = synthetic_Wavelength,
  X.Transmittance = synthetic_X.Transmittance,
  image_name.y = synthetic_image_names,
  microplastics = 0
)

# Merge synthetic data with existing data
final_data <- rbind(combined_data, synthetic_data)

# Write final combined data to CSV
write.csv(final_data, 'final_combined_data.csv', row.names = FALSE)