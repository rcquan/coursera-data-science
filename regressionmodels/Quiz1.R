# Question 1

# Give the value of mu that minimizes the least squares equation
# This value is the empirical mean
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
x <- c(0.18, 0.18, -1.54, rep(0.42, 3), 0.95)
mean(x)

# Question 2

# Fit the regression through the origin and get the slope 
# treating y as the outcome and x as the regressor.
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

lm(y ~ x -1)


# Question 3

# Give the slope coefficient with mpg as the outcome and
# weight as the predictor.
data(mtcars)
lm(mpg ~ wt, data = mtcars)

# Quesiton 4

# If sd of the predictor is one half that of the outcome,
# and the correlation is .5, what value is beta in the regression
# model with Y as the outcome and X as predictor?

# Since beta is cor(y,x)*sd(y)/sd(x), the answer is 0.25

# Question 5

# If the data is normalized, then the correlation is the beta value.
# We can find the outcome by multiplying the predictor by the beta value.

0.4 * 1.5

# Question 6

# Normalize x
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)

((x - mean(x))/sd(x))[1]

# Quesiton 7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y~x)


# Question 8

# It must be identically 0.

# Question 9

# What value minimizes the sum of the squared distances between
# these points and itself?

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)

mean(x)


# Question 10

# (Cor(y,x)*sd(y)/sd(x))/((Cor(y,x*sd(x)(sd(y)))))
# Var(y)/Var(x)

