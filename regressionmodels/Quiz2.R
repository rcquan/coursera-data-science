# Question 1 / Question 2

# Give a p-value for a two sided hypothesis test of whether
# beta-1 from a linear regression model is 0 or not.

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

fit <- lm(y~x)
summary(fit)

# Question 3 / Question 4
a <- data.frame(wt = mean(mtcars$wt))
mtfit <- lm(mpg ~ wt, data = mtcars)
plot(mtcars$mpg ~ mtcars$wt)
abline(mtfit, col = 2)
predict(mtfit, newdata = a, interval = "confidence")

# Question 5
b <- data.frame(wt = 3)
mtfit <- lm(mpg ~ wt, data = mtcars)
plot(mtcars$mpg ~ mtcars$wt)
abline(mtfit, col = 2)
predict(mtfit, newdata = b, interval = "prediction")

# Question 6
mtfit <- lm(mpg ~ I(wt/2), data = mtcars)
summary(mtfit)
predict(mtfit, newdata = data.frame(wt = c(0,1)), interval = "confidence")
