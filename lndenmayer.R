#pip install robustbase
# Definir o espelho do CRAN
options(repos = "https://cloud.r-project.org")

# Instalar o pacote
install.packages("robustbase")
install.packages("ggplot2")

library(robustbase)
library(ggplot2)

# Visualizar possumDiv
View(possumDiv)
readline("Pressione Enter para fechar a tabela...")

# Visualizar possum.mat
View(possum.mat)

# Criar DataFrame possum40
possum40 <- as.data.frame(possum.mat)
possum40$a1 <- possum40$`NW-NE`
possum40$a2 <- possum40$`NW-SE`
possum40$a3 <- possum40$`SE-SW`
possum40$a4 <- possum40$`SW-NW`

# Ajustar o modelo de regressão
reglog <- glm(Diversity ~ Stags + BAcacia + Bark + factor(Stumps) + factor(a1) + factor(a2) + factor(a3) + factor(a4), data=possum40, family="poisson")
reglog <- glm(Diversity ~ Stags + BAcacia + Bark + Stumps + a1 + a2 + a3 + a4, data=possum40, family="poisson")

# Exibir o resumo do modelo
summary(reglog)
readline("Pressione Enter para fechar a janela...")

# Criar um gráfico dos coeficientes estimados
coef_data <- data.frame(Coeficiente = names(coef(reglog)), Estimativa = coef(reglog))
ggplot(coef_data, aes(x = Coeficiente, y = Estimativa)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Coeficiente", y = "Estimativa") +
  ggtitle("Estimativas dos Coeficientes") +
  theme_bw()
