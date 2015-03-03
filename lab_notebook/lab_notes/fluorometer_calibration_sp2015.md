# Calibration of the Fluorometer

## 11 Feb 2015

## Metadata

* file created 3 March 2015 - KF

## Purpose

Provide calibration for the measurement of Chl a using the add-acid method.

## Procedure

**Calibration for the Turner Trilogy Fluorometer with a CHL A (model 7200-040) module**

To measure the Chl and phaeophyton I used the methods described in section 8.0 of the _SOP for Chlorophyll-a and Phaeophyton-a (Turner Designes Methods) 1995.

1. 2 ml of Chl standard in acetone was added to each of "acid" and "no-acid" vials

2. The "no-acid" vial was read immediately on the fluorometer

3. 60 ul of 0.1 N HCl was added to the "acid" vial and the vial was inverted several times to mix.

4. The "no-acid" vial was then read on the fluorometer.

## Data

    samp <- c("blank", "L", "H", "blank", "L", "H")
    chl <- c(0, 20.3, 200, 0, 20.3, 200)
    no.A <- c(1988.49, 43195.17, 428082.53, 1982.33, 41861.96, 435117.65)
    A <- c(NA, 25703.12, 244058.78, 1858.96, 24543.47, 239473.45)
    fl <- data.frame(samp, chl, no.A, A)
    
~~~~

   samp   chl      no.A         A
1 blank   0.0   1988.49        NA
2     L  20.3  43195.17  25703.12
3     H 200.0 428082.53 244058.78
4 blank   0.0   1982.33   1858.96
5     L  20.3  41861.96  24543.47
6     H 200.0 435117.65 239473.45

~~~~

## Calibration
### Chl - a "No Acid""

    summary(lm(chl ~ no.A, data = fl))

~~~~

Call:
lm(formula = chl ~ no.A, data = fl)

Residuals:
      1       2       3       4       5       6 
-0.7157  0.4641  1.5730 -0.7128  1.0827 -1.6913 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -2.070e-01  7.343e-01  -0.282    0.792    
no.A         4.640e-04  2.933e-06 158.226 9.57e-09

Residual standard error: 1.391 on 4 degrees of freedom
Multiple R-squared:  0.9998,  Adjusted R-squared:  0.9998 
F-statistic: 2.504e+04 on 1 and 4 DF,  p-value: 9.57e-09

~~~~

### Phaeophyton - a "Acid"

    summary(lm(chl ~ A, data = fl))

~~~~

Call:
lm(formula = chl ~ A, data = fl)

Residuals:
      2       3       4       5       6 
-0.1514 -1.9180 -0.6355  0.8123  1.8927 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -9.094e-01  1.040e+00  -0.874    0.446    
A            8.311e-04  6.765e-06 122.844 1.19e-06 

Residual standard error: 1.668 on 3 degrees of freedom
  (1 observation deleted due to missingness)
Multiple R-squared:  0.9998,  Adjusted R-squared:  0.9997 
F-statistic: 1.509e+04 on 1 and 3 DF,  p-value: 1.189e-06