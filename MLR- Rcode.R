
# Load library
library(readxl)

# Read excel file
real_estate_sales_1 <- read_excel("Downloads/real_estate_sales-1.xlsx")

# Rename excel file
real.estate <- real_estate_sales_1

# View first rows
head(real.estate)

# Summary Statistics
summary(real.estate)

#---- MODEL 1: Full Model ----#

model1 <- lm(Price ~ SqFt + Bedrooms + Age + Distance, data = real.estate)
summary(model1)

# Interpret: Identify insignificant variables (likely distance)

#---- MODEL 2: Remove insignificant variables ----#

model2 <- lm(Price ~ SqFt + Bedrooms + Age, data = real.estate)
summary(model2)

#--- MODEL 3: Add interaction term ----#
# Create interaction between SqFt and Bedrooms
real.estate$SqFt_Bedrooms <- real.estate$SqFt * real.estate$Bedrooms

model3 <- lm(Price ~ SqFt + Bedrooms + Age + SqFt_Bedrooms, data = real.estate)
summary(model3)

#---- Interaction Plot ----#

# Interaction between SqFt (continuous) and Bedrooms (grouped)
# Create a categorical version of Bedrooms for plotting 
real.estate$BedroomsCat <- factor(real.estate$Bedrooms)

# Interaction Plot: 
with(real.estate,
     interaction.plot(x.factor = BedroomsCat,
                      trace.factor = cut(SqFt, 3, labels = c("Small", "Medium", "Large")),
                      response = Price, 
                      main = "Interaction PlotL SqFt x Bedrooms on Price",
                      xlab = "Number of Bedrooms",
                      ylab = "Average Price ($1000s)",
                      col = c("darkblue", "darkgreen", "red",
                      lwd = 2)))
