---
title: Helpful R Commands
weight: 2
---

Types of Variables (and stuff about them)
---

- Integer/Numeric variables: A number, stored by just using `<-` to assign the number to a variable. Ex: `x <- 4`
- Strings/Characters: A phrase or word, always surrounded by quotation marks. Ex: `y <- "A variable"`
- Vectors: A vector is a set of either numerics or characters (never both). Created by surrounding the items of the vector with `c(  )` and separating them with commas. Ex: `z <- c(1, 2, 3, 4, 5)`
- Dataframes: Similar to an excel spreadsheet, has columns of different variables. You can access different rows and columns in a variety of ways explained below. We will create dataframes using `read.csv()` (explained below)
  - `$` Used to access a particular column in a dataframe. Ex: `df$party_id`
  - `[ , ]` Used to access a particular row and/or column in a dataframe. If you put a number before the comma it will give you that row, a number after the comma will give you that column. Ex: `df[1, ]` (returns the first row), `df[, 2]` (returns the second column), `df[1, 2]` (returns the item in the first row, second column).
  - Note: `[ ]` can also be used for vectors but without a the comma as there is only one dimension. In addition you can put logical statements inside the brackets to subset particular rows or columns.  


Useful Functions
---
- `setwd()` Used to set the the 'work directory' for R. By setting this R knows where to look for files when you call something like `read.csv()`. Ex: `setwd("/users/kevinreuning/downloads")` or `setwd("C:/users/reunink/downloads")`
- `read.csv()` Used to read in a csv file. You need to place a file name in quotes to read it in. The function will output a dataframe that you need to save. Ex: `df <- read.csv('file_name.csv')`
- `mean()`, `median()`, `sd()`, `range()` Used to calculate the mean, median, standard deviation or range of a vector. Remember set `na.rm=T` if you have missing values. Ex: `median(df$income)`
- `table()` Creates a frequency table out of one or two vectors.  Ex: `table(df$pid, df$education)` (would create a frequency table of party identification and education).
- `prop.table()` Turns a frequency table into a table of proportions. The first argument will be just the table. It will default to do a proportion out of all cells, if you want something else you need to use `margin=1` or `margin=2`. `margin=1` will create proportions across rows (so each row will sum to 1), while `margin=2` will create proportions across columns. Ex: `prop.table(table(df$pid, df$education), marin=2)`
- `plot()` Makes simple plots in R. You can specify what will be the x or y axis using `x=` or `y=`. To make a simple scatter plot it is then: `plot(x=df$var1, y=df$var2)`. There are a lot of things you can set to make the plot look better:
  - `col=` The color of the plots (expects a color in quotes such as `'red'`)
  - `xlab=` or `ylab=` Sets the x or y label, whatever you put should be in quotes.
  - `main=` The main title, just like `xlab` and `ylab`.
  - `pch=` Allows you to change the points (can be a number between 0 and 25, just try a few).
- `hist()` Makes a histogram of the vector. You can pick the number of bins by setting `breaks=`. Ex: `hist(df$var1, breaks=10)`.



Linear Regression
---
- `lm()` is used to estimate a linear regression. You will want to start by giving it a formula which is in the form: `dv ~ iv1 + iv2+ iv3` where `dv` and `iv`s are variables in a dataframe (note that they are not in quotations). You will then want to also pass it your dataframe using the `data=` argument. Ex: `mod <- lm(welf_percap~liberal+leg_control+gov, data=df)`
- There are a variety of functions you can call on the output from `lm()` or `glm()` to access important information:
  - `summary()` can be called to provide a summary of the model. Ex: `summary(mod)`
  - `nobs()` calculates the number of observations used in your model.
  - `confint()` calculates a 95% confidence interval for your estimated parameters. You can change it to any percentile by setting `level=` (it defaults to `level=0.95`)
  - `abline()` adds the regression line from an estimated model to an already created scater plot. You call `abline()` after making the plot. For example if you've already ran `plot(y=df$Y, x=df$X)` and `mod <- lm(Y~X, data=df)`, then you'd just call `abline(mod)`.
  - `coef()` and `vcov()` access the coefficients and variance-covariance matrix of your model.
  - `predict()` calculates the predictions for observations in your data (note you can use `newdata=` to provide different data for predictions).
- Finally it is often useful to call the residuals or predictions from your model by doing: `mod$residuals` or `mod$fitted.values`. This assumes that `mod` is the output from `lm()`.

Common problems
---
- I keep getting `NA` as a result.
  - You probably have missing variables in your vector (they are listed as `NA`). Most functions will take `na.rm=T` as an argument to fix this. By setting `na.rm` to `True` you are telling the R function to ignore missing values.
- R is just showing a `+` and nothing is happening.
  - This happens when R thinks that something more is coming. This is often because there is an open parentheses or quotation mark. If you hit the ESC key it will cancel that command and you will see `>` again.


Some other functions (no longer central to POL 306)
---
- `chisq.test()` Calculates a chi-squared test. The two variables should come first and second. Ex: `chisq.test(df$pid, df$education)`
- `t.test()` Calculates a t-test on two variables. The easiest way to use it is with the formula interface where you write your interval variable, then the ~ (tilde) and then the variable that divided your groups. You can simplify this by using the `data=` argument if both variables are in a dataframe. In addition `alternative=` is used to set the alternative hypothesis. It can be: 'two.sided', 'greater', or 'less' Ex: `t.test(per_cap_income~dem_control, data=df, alternative='two.sided')`
- `cor()` Calculates the correlation between two vectors. You should provide the two vectors as the first two arguments. In addition you can select what type of correlation using `method=` (look at the help file for the options `?cor()`). The one different part of `cor()` is that it handles missing values differently than other functions. To have it ignore all missing files set `use='complete.obs'`. EX: `cor(df$per_cap_income, df$violent_crime_rate, use='complete.obs')`
- `cor.test()` Same as `cor()` but provides hypothesis testing as well.  
- `glm()` acts a lot like `lm()` but provides other types of models. To select a model you use `family=`. A logit model can be estimated by setting `family=binomial()`.
