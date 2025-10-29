# Real Estate Price Prediction – Multiple Linear Regression in R

## Overview
This code applies multiple linear regression to analyze the factors that influence housing prices.  
The dataset includes 100 observations of homes with variables such as square footage, number of bedrooms, age, and distance from the city center.  
The analysis identifies key predictors of housing price and evaluates how house size interacts with the number of bedrooms.

---

## Dataset Description
| Variable | Description | Type |
|-----------|--------------|------|
| Price | House price (in $1000s) | Numeric |
| SqFt | Square footage of the house | Numeric |
| Bedrooms | Number of bedrooms | Numeric |
| Age | Age of the house (years) | Numeric |
| Distance | Distance from city center (miles) | Numeric |
| SqFt_Bedrooms | Interaction term: SqFt × Bedrooms | Numeric |
| BedroomsCat | Categorical version of Bedrooms (for plots) | Factor |

---

## Model Summaries

### Model 1: `Price ~ SqFt + Bedrooms + Age + Distance`
| Metric | Value |
|---------|--------|
| Multiple R² | 0.9389 |
| Adjusted R² | 0.9363 |
| Residual Std. Error | 24.99 |
| F-statistic | 365 (p < 2.2e-16) |

**Interpretation:**  
Square footage, bedrooms, and age are significant predictors of price.  
Distance is not statistically significant (p = 0.662).  
Price increases with larger and newer homes and decreases with age.

---

### Model 2: `Price ~ SqFt + Bedrooms + Age`
| Metric | Value |
|---------|--------|
| Multiple R² | 0.9388 |
| Adjusted R² | 0.9369 |
| Residual Std. Error | 24.88 |
| F-statistic | 490.7 (p < 2.2e-16) |

**Interpretation:**  
Excluding Distance does not reduce model accuracy.  
All remaining variables remain statistically significant.  
This model provides a more efficient representation without loss of explanatory power.

---

### Model 3: `Price ~ SqFt + Bedrooms + Age + SqFt_Bedrooms`
| Metric | Value |
|---------|--------|
| Multiple R² | 0.9442 |
| Adjusted R² | 0.9418 |
| Residual Std. Error | 23.89 |
| F-statistic | 401.7 (p < 2.2e-16) |

---

**Interpretation:**  
Including the interaction term improves the model fit.  
The interaction between square footage and bedrooms is statistically significant (p = 0.003).  
This indicates that the relationship between house size and price depends on bedroom count, with larger homes gaining proportionally higher value.

---

## Key Findings
- The optimal model includes the interaction term:  
  `Price ~ SqFt + Bedrooms + Age + SqFt_Bedrooms`
- Adjusted R² = 0.9418 indicates a strong overall model fit.
- Square footage, bedrooms, and age are statistically significant predictors of housing price.
- Distance does not significantly affect price once other variables are considered.
- The interaction term demonstrates that house size and bedroom count jointly influence price, with larger homes gaining proportionally greater value.

---

## Tools and Methods
| Category | Details |
|-----------|----------|
| **Software** | R |
| **Key Functions** | `lm()`, `summary()`, `interaction.plot()` |
| **Libraries** | Base R |
| **Analysis Type** | Multiple Linear Regression with Interaction Term |

---

ih19/
|
| MLR - RPlot.png              # Interaction and regression visualization
| MLR- Rcode.R                 # R script containing model code and plots
| real_estate_sales-1.xlsx     # Dataset used in the analysis
| README.md                    # Project documentation

