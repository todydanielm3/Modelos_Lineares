# Definir o espelho do CRAN
options(repos = "https://cloud.r-project.org")

# Instalar o pacote
install.packages("robustbase")

library(robustbase)
View(possumDiv)
View(possum.mat)

possum40 = as.data.frame(possum.mat)
possum40$a1 = possum40$`NW-NE`
possum40$a2 = possum40$`NW-SE`
possum40$a3 = possum40$`SE-SW`
possum40$a4 = possum40$`SW-NW`

# Selecionar as variáveis numéricas contínuas
variaveis_numericas <- possum40[, c("Var1", "Var2", "Var3")]

# Padronizar as variáveis numéricas contínuas
variaveis_numericas_padronizadas <- scale(variaveis_numericas)

# Realizar o PCA
resultado_pca <- prcomp(variaveis_numericas_padronizadas)

# Acessar os componentes principais
componentes_principais <- resultado_pca$x

# Acessar as proporções de variância explicada por cada componente
var_explicada <- resultado_pca$sdev^2 / sum(resultado_pca$sdev^2)

# Exibir os resultados
print(componentes_principais)
print(var_explicada)

reglog = glm(Diversity ~ Stags + BAcacia + Bark + factor(Stumps) + factor(a1) + factor(a2) + factor(a3) + factor(a4), data=possum40, family="poisson")
reglog = glm(Diversity ~ Stags + BAcacia + Bark + Stumps + a1 + a2 + a3 + a4, data=possum40, family="poisson")

summary(reglog)
