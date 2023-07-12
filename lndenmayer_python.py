import pandas as pd
import statsmodels.api as sm

from robustbase import lmrob

# Carregar os dados
possumDiv = pd.read_csv("possumDiv.csv")
possumMat = pd.read_csv("possum.mat.csv")

# Visualizar possumDiv
print(possumDiv)

input("Pressione Enter para fechar a tabela...")

# Visualizar possumMat
print(possumMat)

# Criar DataFrame possum40
possum40 = possumMat.copy()
possum40["a1"] = possum40["NW-NE"]
possum40["a2"] = possum40["NW-SE"]
possum40["a3"] = possum40["SE-SW"]
possum40["a4"] = possum40["SW-NW"]

# Ajustar o modelo de regressão
X = possum40[["Stags", "BAcacia", "Bark", "Stumps", "a1", "a2", "a3", "a4"]]
y = possum40["Diversity"]
model = sm.GLM(y, sm.add_constant(X), family=sm.families.Poisson()).fit()

# Exibir o resumo do modelo
print(model.summary())

input("Pressione Enter para fechar a janela...")

