install.packages("likert")
dados[,2:6] <- lapply(dados[,2:6], function(x){ factor(x,
                                                       levels=c("1", "2", "3", "4", "5"),
                                                       labels = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree"))})
names(dados)[2:6] <- paste(names(dados)[2:6], itens$Text, sep = "_")

library(likert)
lik <- likert(as.data.frame(dados[,2:6]))

#Opção 1
plot(lik, wrap = 60, text.size=4) + theme(axis.text.y = element_text(size="10"))

# Opção 2
plot(lik, type = "heat", wrap = 60, text.size=3) + theme(axis.text.y = element_text( size="10"))

#SEPARAR POR CATEGORIA
lik2 <- likert(as.data.frame(dados[ , 5:8]), grouping = dados$categ)
plot(lik2, wrap = 60, text.size=3) + theme(axis.text.y = element_text(size="6"))