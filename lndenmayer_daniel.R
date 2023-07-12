# Definir o espelho do CRAN
options(repos = "https://cloud.r-project.org")

# Instalar o pacote
install.packages("robustbase")

library(robustbase)

# Verificar se o objeto "possum" é um data frame
if (!is.data.frame(possum)) {
  # Converter o objeto em um data frame
  possum <- as.data.frame(possum)
}

# Criar as variáveis a1, a2, a3 e a4
possum$a1 <- possum$`NW-NE`
possum$a2 <- possum$`NW-SE`
possum$a3 <- possum$`SE-SW`
possum$a4 <- possum$`SW-NW`

# Ajustar o modelo de regressão logística
reglog <- glm(Diversity ~ Stags + BAcacia + Bark + Stumps + a1 + a2 + a3 + a4,
              data = possum, family = "poisson")

# Exibir um resumo dos resultados
summary(reglog)
