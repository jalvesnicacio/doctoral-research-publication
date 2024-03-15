install.packages("likert")
install.packages("readxl")
library(likert)
library(readxl)

setwd("~/doctoral-research-data/survey/scripts")

dados <- read_excel("dados_likert_fr.xlsx", sheet = "D104")
itens <- read_excel("dados_likert_fr.xlsx", sheet = "Likert_Questions")

dados[,2:6] <- lapply(dados[,2:6], function(x){ factor(x,
                                                       levels=c("1", "2", "3", "4", "5"),
                                                       labels = c("Pas du tout\nd'accord", "Pas\nd’accord", "Ni d'accord\nni en\ndésaccord", "D’accord", "Tout à fait\nd’accord"))})
names(dados)[2:6] <- paste(names(dados)[2:6], itens$Text, sep = "_")


lik <- likert(as.data.frame(dados[,2:6]))

#Opção 1
plot(lik, wrap = 35, text.size=4) + theme(axis.text.y = element_text(size="9.5"))

# Opção 2 heat map
plot(lik, type = "heat", wrap = 60, text.size=3) + theme(axis.text.y = element_text( size="5"))

#SEPARAR POR CATEGORIA
lik2 <- likert(as.data.frame(dados[ , 5:8]), grouping = dados$categ)
plot(lik2, wrap = 60, text.size=3) + theme(axis.text.y = element_text(size="6"))