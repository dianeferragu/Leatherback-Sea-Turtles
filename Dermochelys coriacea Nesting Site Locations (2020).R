# Load Libraries
library(ggplot2)
library(readxl)
library(maps)

# Data
data2 <- read_excel("/Users/diane/Downloads/data 2020.xlsx")
head(data)

# Map
world_map <- map_data("world")

# Graph
point_map_plot <- ggplot(data2, aes(x = longitude, y = latitude)) +
  borders("world", colour = "grey60", fill = "grey85") +  
  geom_point(color = "#FF4500", size = 2.5, alpha = 0.7) +  
  coord_fixed(1.3, xlim = c(-180, 180), ylim = c(-90, 90)) +
  theme_minimal(base_size = 15) +
  theme(
    panel.grid.major = element_line(color = "grey80", size = 0.2),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "#f7f9fc", color = NA),
    plot.title = element_text(face = "bold", size = 15, hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "grey40"),
    axis.title = element_text(face = "bold", color = "grey30"),
    axis.text = element_text(color = "grey50"),
    legend.position = "none"
  ) +
  labs(
    title = "Dermochelys coriacea Nesting Site Locations (2020)",
    subtitle = "Mapping of global leatherback sea turtle nesting sites after Endagered Species Act",
    x = "Longitude", 
    y = "Latitude"
  )
print(point_map_plot)