
rm(list=ls(pat="*"))     # Remove all objects



##############################################
library(nlmr)
library(ggplot2)

#####################################################################
# Data preparted in STATA:
df1<- read.csv("ukb_nlmrdata.csv", head = T, sep = ",", quote = "")


############################
## (1) y: age_pheno
# Drop rows with NA:
df2 = data.frame(df1$avg_carbohydrate, df1$age_pheno, df1$GSIV_carb2, df1$age, df1$bmi,
                 df1$male, df1$Townsend_deprivation_index,
                 df1$pca1, df1$pca2, df1$pca3, df1$pca4, df1$pca5, df1$pca6,
                 df1$pca7, df1$pca8, df1$pca9, df1$pca10,
                 df1$avg_fat, df1$avg_protein, df1$college)
df2 = df2[complete.cases(df2),]

##
x <- df2$df1.avg_carbohydrate
y <- df2$df1.age_pheno
g <- df2$df1.GSIV_carb2


### Covariates (c)
c1 = df2$df1.age
c2 = df2$df1.bmi
c3 = df2$df1.male
c4 = df2$df1.Townsend_deprivation_index
c5 = df2$df1.pca1
c6 = df2$df1.pca2
c7 = df2$df1.pca3
c8 = df2$df1.pca4
c9 = df2$df1.pca5
c10 = df2$df1.pca6
c11 = df2$df1.pca7
c12 = df2$df1.pca8
c13 = df2$df1.pca9
c14 = df2$df1.pca10
c15 = df2$df1.avg_fat
c16 = df2$df1.avg_protein
c17 = df2$df1.college
c18 = df2$df1.regiondum1
c19 = df2$df1.regiondum2
c20 = df2$df1.regiondum3
c21 = df2$df1.regiondum4
c22 = df2$df1.regiondum5
c23 = df2$df1.regiondum6
c24 = df2$df1.regiondum7
c25 = df2$df1.regiondum8
c26 = df2$df1.regiondum9
c27 = df2$df1.regiondum10

# c = data.frame(c1 = c1, c2 = c2, c3 = as.factor(c3))
c = data.frame(c1 = c1, c2 = c2, c3 = c3, c4 = c4, c5 = c5,
               c6 = c6, c7 = c7, c8 = c8, c9 = c9, c10 = c10,
               c11 = c11, c12 = c12, c13 = c13, c14 = c14, c15 = c15, c16 = c16,
               c17 = c17, c18 = c18, c19 = c19, c20 = c20, c21 = c21, c22 = c22,
               c23 = c23, c24 = c24, c25 = c25, c26 = c26, c27 = c27)



### Analyses
fp = fracpoly_mr(y, x, g, c, family = "gaussian", q = 10, d = "both", ci = "model_se", fig = TRUE)
summary(fp)

plm = piecewise_mr(y, x, g, c, family = "gaussian", q = 10, nboot = 50, fig = TRUE)
summary(plm)


###################################
## (2) y: LTL
# Drop rows with NA:
df2 = data.frame(df1$avg_carbohydrate, df1$zadjustedtsloginstance0, df1$GSIV_carb2, df1$age, df1$bmi,
                 df1$male, df1$Townsend_deprivation_index,
                 df1$pca1, df1$pca2, df1$pca3, df1$pca4, df1$pca5, df1$pca6,
                 df1$pca7, df1$pca8, df1$pca9, df1$pca10,
                 df1$avg_fat, df1$avg_protein, df1$college, df1$regiondum1,
                 df1$regiondum2, df1$regiondum3, df1$regiondum4, df1$regiondum5, df1$regiondum6,
                 df1$regiondum7, df1$regiondum8, df1$regiondum9, df1$regiondum10)
df2 = df2[complete.cases(df2),]

##
x <- df2$df1.avg_carbohydrate
y <- df2$df1.zadjustedtsloginstance0
g <- df2$df1.GSIV_carb2


### Covariates (c)
c1 = df2$df1.age
c2 = df2$df1.bmi
c3 = df2$df1.male
c4 = df2$df1.Townsend_deprivation_index
c5 = df2$df1.pca1
c6 = df2$df1.pca2
c7 = df2$df1.pca3
c8 = df2$df1.pca4
c9 = df2$df1.pca5
c10 = df2$df1.pca6
c11 = df2$df1.pca7
c12 = df2$df1.pca8
c13 = df2$df1.pca9
c14 = df2$df1.pca10
c15 = df2$df1.avg_fat
c16 = df2$df1.avg_protein
c17 = df2$df1.college
c18 = df2$df1.regiondum1
c19 = df2$df1.regiondum2
c20 = df2$df1.regiondum3
c21 = df2$df1.regiondum4
c22 = df2$df1.regiondum5
c23 = df2$df1.regiondum6
c24 = df2$df1.regiondum7
c25 = df2$df1.regiondum8
c26 = df2$df1.regiondum9
c27 = df2$df1.regiondum10

# c = data.frame(c1 = c1, c2 = c2, c3 = as.factor(c3))
c = data.frame(c1 = c1, c2 = c2, c3 = c3, c4 = c4, c5 = c5,
               c6 = c6, c7 = c7, c8 = c8, c9 = c9, c10 = c10,
               c11 = c11, c12 = c12, c13 = c13, c14 = c14, c15 = c15, c16 = c16,
               c17 = c17, c18 = c18, c19 = c19, c20 = c20, c21 = c21, c22 = c22,
               c23 = c23, c24 = c24, c25 = c25, c26 = c26, c27 = c27)



### Analyses
fp = fracpoly_mr(y, x, g, c, family = "gaussian", q = 10, d = "both", ci = "model_se", fig = TRUE)
summary(fp)

plm = piecewise_mr(y, x, g, c, family = "gaussian", q = 10, nboot = 50, fig = TRUE)
summary(plm)




###################################
## (3) y: GMV
# Drop rows with NA:
df2 = data.frame(df1$avg_carbohydrate, df1$grey_matter_volume, df1$GSIV_carb2, df1$age, df1$bmi,
                 df1$male, df1$Townsend_deprivation_index,
                 df1$pca1, df1$pca2, df1$pca3, df1$pca4, df1$pca5, df1$pca6,
                 df1$pca7, df1$pca8, df1$pca9, df1$pca10,
                 df1$avg_fat, df1$avg_protein, df1$college, df1$regiondum1,
                 df1$regiondum2, df1$regiondum3, df1$regiondum4, df1$regiondum5, df1$regiondum6,
                 df1$regiondum7, df1$regiondum8, df1$regiondum9, df1$regiondum10)
df2 = df2[complete.cases(df2),]

##
x <- df2$df1.avg_carbohydrate
y <- df2$df1.grey_matter_volume
g <- df2$df1.GSIV_carb2


### Covariates (c)
c1 = df2$df1.age
# c2 = df2$df1.bmi
c3 = df2$df1.male
c4 = df2$df1.Townsend_deprivation_index
c5 = df2$df1.pca1
c6 = df2$df1.pca2
c7 = df2$df1.pca3
c8 = df2$df1.pca4
c9 = df2$df1.pca5
c10 = df2$df1.pca6
c11 = df2$df1.pca7
c12 = df2$df1.pca8
c13 = df2$df1.pca9
c14 = df2$df1.pca10
# c15 = df2$df1.avg_fat
# c16 = df2$df1.avg_protein
c17 = df2$df1.college
c18 = df2$df1.regiondum1
c19 = df2$df1.regiondum2
c20 = df2$df1.regiondum3
c21 = df2$df1.regiondum4
c22 = df2$df1.regiondum5
c23 = df2$df1.regiondum6
c24 = df2$df1.regiondum7
c25 = df2$df1.regiondum8
c26 = df2$df1.regiondum9
c27 = df2$df1.regiondum10

# c = data.frame(c1 = c1, c2 = c2, c3 = as.factor(c3))
c = data.frame(c1 = c1, 
               # c2 = c2, 
               c3 = c3, c4 = c4, c5 = c5,
               c6 = c6, c7 = c7, c8 = c8, c9 = c9, c10 = c10,
               c11 = c11, c12 = c12, c13 = c13, c14 = c14, 
               # c15 = c15, c16 = c16,
               c17 = c17, c18 = c18, c19 = c19, c20 = c20, c21 = c21, c22 = c22,
               c23 = c23, c24 = c24, c25 = c25, c26 = c26, c27 = c27)



### Analyses
fp = fracpoly_mr(y, x, g, c, family = "gaussian", q = 10, d = "both", ci = "model_se", fig = TRUE)
summary(fp)

plm = piecewise_mr(y, x, g, c, family = "gaussian", q = 10, nboot = 50, fig = TRUE)
summary(plm)




###################################
## (4) y: WMV
# Drop rows with NA:
df2 = data.frame(df1$avg_carbohydrate, df1$white_matter_volume, df1$GSIV_carb2, df1$age, df1$bmi,
                 df1$male, df1$Townsend_deprivation_index,
                 df1$pca1, df1$pca2, df1$pca3, df1$pca4, df1$pca5, df1$pca6,
                 df1$pca7, df1$pca8, df1$pca9, df1$pca10,
                 df1$avg_fat, df1$avg_protein, df1$college, df1$regiondum1,
                 df1$regiondum2, df1$regiondum3, df1$regiondum4, df1$regiondum5, df1$regiondum6,
                 df1$regiondum7, df1$regiondum8, df1$regiondum9, df1$regiondum10)
df2 = df2[complete.cases(df2),]

##
x <- df2$df1.avg_carbohydrate
y <- df2$df1.white_matter_volume
g <- df2$df1.GSIV_carb2


### Covariates (c)
c1 = df2$df1.age
c2 = df2$df1.bmi
c3 = df2$df1.male
c4 = df2$df1.Townsend_deprivation_index
c5 = df2$df1.pca1
c6 = df2$df1.pca2
c7 = df2$df1.pca3
c8 = df2$df1.pca4
c9 = df2$df1.pca5
c10 = df2$df1.pca6
c11 = df2$df1.pca7
c12 = df2$df1.pca8
c13 = df2$df1.pca9
c14 = df2$df1.pca10
c15 = df2$df1.avg_fat
c16 = df2$df1.avg_protein
c17 = df2$df1.college
c18 = df2$df1.regiondum1
c19 = df2$df1.regiondum2
c20 = df2$df1.regiondum3
c21 = df2$df1.regiondum4
c22 = df2$df1.regiondum5
c23 = df2$df1.regiondum6
c24 = df2$df1.regiondum7
c25 = df2$df1.regiondum8
c26 = df2$df1.regiondum9
c27 = df2$df1.regiondum10

# c = data.frame(c1 = c1, c2 = c2, c3 = as.factor(c3))
c = data.frame(c1 = c1, 
               # c2 = c2, 
               c3 = c3, c4 = c4, c5 = c5,
               c6 = c6, c7 = c7, c8 = c8, c9 = c9, c10 = c10,
               c11 = c11, c12 = c12, c13 = c13, c14 = c14, 
               # c15 = c15, c16 = c16,
               c17 = c17, c18 = c18, c19 = c19, c20 = c20, c21 = c21, c22 = c22,
               c23 = c23, c24 = c24, c25 = c25, c26 = c26, c27 = c27)



### Analyses
fp = fracpoly_mr(y, x, g, c, family = "gaussian", q = 10, d = "both", ci = "model_se", fig = TRUE)
summary(fp)

plm = piecewise_mr(y, x, g, c, family = "gaussian", q = 10, nboot = 50, fig = TRUE)
summary(plm)