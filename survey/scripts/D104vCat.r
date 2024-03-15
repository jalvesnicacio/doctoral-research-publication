install.packages("likert")
dados[ , 3:7] <- lapply(dados[ , 3:7], function(x){ factor(x,
                                                       levels=c("1", "2", "3", "4", "5"),
                                                       labels = c("Strongly disagree", "Disagree", "Neither agree nor disagree", "Agree", "Strongly agree"))})
names(dados)[3:7] <- paste(names(dados)[3:7], itens$Text, sep = "_")

library(likert)
lik <- likert(as.data.frame(dados[,2:6]))

#Opção 1
plot(lik, wrap = 60, text.size=4) + theme(axis.text.y = element_text(size="10"))

# Opção 2
plot(lik, type = "heat", wrap = 60, text.size=3) + theme(axis.text.y = element_text( size="10"))

#SEPARAR POR CATEGORIA
lik2 <- likert(as.data.frame(dados[ , 6:7]), grouping = dados$Categories)
plot(lik2, wrap = 60, text.size=4) + theme(axis.text.y = element_text(size="10"))
