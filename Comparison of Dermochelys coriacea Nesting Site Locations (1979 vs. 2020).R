# Load Libraries
library(ggplot2)
library(readxl)
library(maps)

# Load Data
data1 <- read_excel('/Users/diane/Library/Mobile Documents/com~apple~CloudDocs/11th grade/Costa Rica/Research Symposium/1979 Map of Dermochelys coriacea Nesting Site Data.xlsx')  # Adjust file path
data2 <- read_excel('/Users/diane/Library/Mobile Documents/com~apple~CloudDocs/11th grade/Costa Rica/Research Symposium/2020 Map of Dermochelys coriacea Nesting Site Data.xlsx')  # Adjust file path

# Map
world_map <- map_data("world")

# Enhanced Combined Point Map Plot
combined_plot <- ggplot() +
  borders("world", colour = "grey60", fill = "grey85") +
  geom_point(
    data = data1,
    aes(x = longitude, y = latitude),
    color = "#FF4500", size = 2.5, alpha = 0.7
  ) +
  geom_point(
    data = data2,
    aes(x = longitude, y = latitude),
    color = "#1E90FF", size = 2.5, alpha = 0.7
  ) +
  coord_fixed(1.3, xlim = c(-180, 180), ylim = c(-90, 90)) +
  theme_minimal(base_size = 15) +
  theme(
    panel.grid.major = element_line(color = "grey80", size = 0.2),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "#f7f9fc", color = NA),
    plot.title = element_text(face = "bold", size = 9, hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "grey40"),
    axis.title = element_text(face = "bold", color = "grey30"),
    axis.text = element_text(color = "grey50"),
    legend.position = "none"
  ) +
  labs(
    title = "Comparison of Dermochelys coriacea Nesting Site Locations (1979 vs. 2020)",
    x = "Longitude",
    y = "Latitude"
  )
print(combined_plot)

