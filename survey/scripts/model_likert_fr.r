install.packages("likert")
install.packages("readxl")
library(likert)
library(readxl)

dados <- read_excel("dados_likert_fr.xlsx", sheet = "modeling_experience_data")
itens <- read_excel("dados_likert_fr.xlsx", sheet = "model_questions")

dados[ , 3:4] <- lapply(dados[ , 3:4], function(x){ factor(x,
                                                       levels=c("1", "2", "3"),
                                                       labels = c("Jamais", "Sporadiquement", "Souvent"))})
names(dados)[3:4] <- paste(names(dados)[3:4], itens$Text, sep = " : ")

lik <- likert(as.data.frame(dados[,3:4]))

#Opção 1
plot(lik, wrap = 60, text.size=4) + theme(axis.text.y = element_text(size="10"))

# Opção 2
plot(lik, type = "heat", wrap = 60, text.size=3) + theme(axis.text.y = element_text( size="10"))

#SEPARAR POR CATEGORIA
lik2 <- likert(as.data.frame(dados[ , 3:4]), grouping = dados$DQ06)
plot(lik2, wrap = 60, text.size=4) + theme(axis.text.y = element_text(size="10"))
