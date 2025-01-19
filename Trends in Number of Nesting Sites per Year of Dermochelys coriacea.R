# Libraries
library(ggplot2)
library(readxl)
library(broom)  

# Data
data <- read_excel("/Users/diane/Library/Mobile Documents/com~apple~CloudDocs/11th grade/Costa Rica/Research Symposium/Best Line of Fit Data (Dermochelys coriacea).xlsx")  

# P
model <- lm(Year ~ Locations, data = data)  
model_summary <- tidy(model)
p_value <- model_summary$p.value[2]  
print(p_value)

# Graph
p <- ggplot(data, aes(x = Locations, y = Year)) + 
  geom_point(color = "darkorange", size = 2, alpha = 0.7) +    
  geom_smooth(method = "lm", se = TRUE, color = "steelblue", fill = "lightblue", alpha = 0.3) + 
  labs(title = "Trends in Number of Nesting Sites per Year of Dermochelys coriacea", x = "Number of Nesting Sites", y = "Year") +
  theme_minimal(base_size = 15) + 
  theme(
    plot.title = element_text(hjust = 0.5, size = 10, face = "bold"),  
    axis.title.x = element_text(size = 9, face = "bold"),  
    axis.title.y = element_text(size = 9, face = "bold"),  
    axis.text = element_text(size = 8), 
    panel.grid.minor = element_blank()     
  ) 
print(p)