# 1

d <- read.table("communities.data", h=F, sep=",")

# 2

d <- d[, -(1:5)]

# 3

d <- d[, !apply(d == '?', 2, any)]

# 4

n <- nrow(d)
U <- d[seq(from = 2, to = n, by = 2), ]
T <- d[seq(from = 1, to = n, by = 2), ]
rownames(U) <- NULL
rownames(T) <- NULL

# 5

m <- lm(V128~., data = U)

# 6

# Odrzucimy z danych obserwacje wplywowe
# Skorzystamy z cook's distance
# Odrzucimy wszystkie rekordy, ktorych cook distance przekroczy 0.015

summary(m)
plot(m, which = 4) 

cook <- unname(cooks.distance(m))
wh <- which(cook == max(cook))
cook_dist <- cook[wh]
U_mod <- U[-wh,]
rownames(U) <- NULL
i <- 1

while (TRUE) {
  print(i)
  i <- i + 1
  m_mod <- lm(V128~., data = U_mod)
  plot(m_mod, which = 4)
  cook <- unname(cooks.distance(m_mod))
  wh <- which(cook == max(cook))
  cook_dist <- cook[wh]
  print(cook_dist)
  if (cook_dist > 0.015) {
    U_mod <- U_mod[-wh,]
    rownames(U_mod) <- NULL
  } else {
    break
  }
}

# 7

# BIC

# dla modelu m
n <- nrow(U)
m_BIC <- step(m, direction="backward", k=log(n))

# dla modelu m_mod
n <- nrow(U_mod)
m_mod_BIC <- step(m_mod, direction="backward", k=log(n))

# Funkcja do wyznacznia zmiennych z kryterium Mallowsa

Mallows_backward <- function(m, U) {
  X <- model.matrix(m)
  n <- nrow(X)
  p <- ncol(X)
  col_names <- colnames(X)[-1]
  SSE <- sum(residuals(m)^2)
  sigma2 <- summary(m)$sigma^2
  wynik_poprz <- SSE + 2*sigma2*p
  
  for (i in 1:p) {
    wyniki <- numeric(length = length(col_names))
    for (j in 1:length(col_names)) {
      f <- as.formula(paste0('V128~', paste(col_names[-j], collapse="+")))
      m2 <- lm(f, data = U)
      X <- model.matrix(m2)
      p <- ncol(X)
      SSE <- sum(residuals(m2)^2)
      wyniki[j] <- SSE + 2*sigma2*p
    }
    if (wynik_poprz < min(wyniki)) {
      break
    }
    wynik_poprz <- min(wyniki)
    col_names <- col_names[-which(wyniki == wynik_poprz)]
    print(paste0('V128~', paste(col_names, collapse="+")))
  }
  return(paste0('V128~', paste(col_names, collapse="+")))
}

# Mallows dla modelu m

Mallows_backward(m, U)
m_Mallows <- lm(V128~V6+V8+V11+V13+V16+V17+V18+V20+V24+V25+V27+V29+V30+V34+
                  V35+V36+V39+V40+V42+V43+V45+V50+V51+V53+V54+V56+V59+V60+
                  V63+V64+V66+V70+V71+V72+V74+V77+V78+V81+V84+V88+V91+V94+
                  V96+V126, data = U)

# Mallows dla modelu m_mod

Mallows_backward(m_mod, U_mod)
m_mod_Mallows <- lm(V128~V7+V8+V9+V13+V18+V19+V20+V24+V25+V27+V34+V35+V36+
                      V39+V40+V45+V50+V51+V54+V55+V56+V59+V60+V63+V64+V68+
                      V74+V77+V78+V81+V84+V89+V91+V94+V95+V96+V99+V126,
                    data = U_mod)

# 8

library(glmnet)
X <- as.matrix(U[,-100])
Y <- U[,100]
cv1 <- cv.glmnet(X, Y, alpha=1, nfolds = 10)
lambda <- cv1$lambda.1se
m_lasso <- glmnet(X, Y, alpha = 1, lambda = lambda)

# 9

# Decision Tree

library(rpart)
m_myidea <- rpart(V128~., data = U)

# 10

y_pred_m <- predict(m, T[,-100])
y_pred_m_mod <- predict(m_mod, T[,-100])
y_pred_m_BIC <- predict(m_BIC, T[,-100])
y_pred_m_Mallows <- predict(m_Mallows, T[,-100])
y_pred_m_mod_BIC <- predict(m_mod_BIC, T[,-100])
y_pred_m_mod_Mallows <- predict(m_mod_Mallows, T[,-100])
y_pred_m_lasso <- predict(m_lasso, as.matrix(T[,-100]))
y_pred_m_myidea <- predict(m_myidea, T[,-100])

m_empty <- lm(V128~1, data = U) # model z samym interceptem
y_pred_m_empty <- predict(m_empty, T[,-100])

# 11

RMSE <- function(y, y_pred) {
  return(sqrt(sum((y-y_pred)^2)))
}

y <- T[,100]
RMSE_m <- RMSE(y, y_pred_m)
RMSE_m_mod <- RMSE(y, y_pred_m_mod)
RMSE_m_BIC <- RMSE(y, y_pred_m_BIC)
RMSE_m_Mallows <- RMSE(y, y_pred_m_Mallows)
RMSE_m_mod_BIC <- RMSE(y, y_pred_m_mod_BIC)
RMSE_m_mod_Mallows <- RMSE(y, y_pred_m_mod_Mallows)
RMSE_m_lasso <- RMSE(y, y_pred_m_lasso)
RMSE_m_myidea <- RMSE(y, y_pred_m_myidea)
RMSE_m_empty <- RMSE(y, y_pred_m_empty)

# 12

# Spisanie obliczonych wartosci RMSE do pliku, 
# dodatkowo liczby zmiennych w modelach:

length(coef(m))-1
length(coef(m_mod))-1
length(coef(m_BIC))-1
length(coef(m_Mallows))-1
length(coef(m_mod_BIC))-1
length(coef(m_mod_Mallows))-1
length(which(coef(m_lasso) != 0))-1
# length(coef(m_myidea)) - 100
length(coef(m_empty))-1


