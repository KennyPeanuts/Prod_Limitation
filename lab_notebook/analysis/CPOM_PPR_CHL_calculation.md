# Calculaton of the chl-a concentration from the CPOM-PPR experiment

## Spring 2015

* file created 25 March 2015 - KF

## Data

### Chlorophyll data

    chl <- read.table("./data/CPOM_PPR_chl_19March2015.csv", header = T, sep = ",")

### Fluorometer Calibration

    f1 <- read.table("./data/fluorometer_calibration_11Feb2015.csv", header = T, sep = "," )

## Calculation of the Calibration


    r.raw <- c(f1$no.A[f1$samp == "L"], f1$no.A[f1$samp == "H"]) / c(f1$A[f1$samp == "L"], f1$A[f1$samp == "H"])
    r <- mean(r.raw)

    std.chl.RFU <- (r / (r - 1)) * (f1$no.A - f1$A)
    std.phaeo.RFU <- (r / (r - 1)) * ((r * f1$A) - f1$no.A)

    # chl calibration curve
    summary(lm(f1$chl ~ std.chl.RFU))

~~~~~
  
  lm(formula = f1$chl ~ std.chl.RFU)

Residuals:
  2       3       4       5       6 
0.5706  6.1991 -1.5743  0.7521 -5.9475 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 1.445e+00  3.123e+00   0.463    0.675    
std.chl.RFU 4.443e-04  1.101e-05  40.369 3.34e-05 ***

Residual standard error: 5.072 on 3 degrees of freedom
(1 observation deleted due to missingness)
Multiple R-squared:  0.9982,  Adjusted R-squared:  0.9976 
F-statistic:  1630 on 1 and 3 DF,  p-value: 3.345e-05
  
~~~~~
  
  # chl calibration curve
  summary(lm(f1$chl ~ std.phaeo.RFU))

**this is not working**


    chl.RFU <- (r / (r-1)) * (chl$RFU.pre - chl$RFU.acid)
    phaeo.RFU <- (r / (r-1)) * ((r * chl$RFU.acid) - chl$RFU.pre)
     
