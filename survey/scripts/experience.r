library(ggplot2)
library(reshape2)

dados = read.csv("experience.csv", header = TRUE)
pcm = melt(dados, id = c("Experience"))

#define the colours to use in the figure
colours = c( "#86BBD8", "#F7EE7F", "#582630","#F1A66A","#F26157", "#F9ECCC", "#679289", "#33658A", "#F6AE2D","#86BBD8")
pcm$Experience <- factor(pcm$Experience,levels=unique(pcm$Experience))

xx = ggplot(pcm, aes(x = Experience, y = variable)) + 
  geom_point(aes(size = value, fill = variable), alpha = 0.95, shape = 21) + 
  scale_size_continuous(limits = c(0.000001, 100), range = c(1,25), breaks = c(1,10,50,75)) + 
  labs( x= "", y = "", size = "Frequency of use of diagrams (%)", fill = "")  + 
  theme(legend.key=element_blank(), 
        axis.text.x = element_text(colour = "black", size = 12, angle = 90, vjust = 0.3, hjust = 1), 
        axis.text.y = element_text(colour = "black", size = 11), 
        legend.text = element_text(size = 10, face ="bold", colour ="black"), 
        legend.title = element_text(size = 12, face = "bold"), 
        panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size = 1), 
        legend.position = "right") +  
  scale_fill_manual(values = colours, guide = "none") + 
  scale_y_discrete(limits = rev(levels(pcm$variable))) 

xx

#make the plot!
mx = ggplot(pcm, aes(x = Experience, fill = variable, y = value)) + 
  geom_bar(stat = "identity", colour = "#333333") + 
  theme(axis.text.x = element_text(angle = 90, size = 14, colour = "black", vjust = 0.5, hjust = 1), 
        axis.title.y = element_text(size = 16), legend.title = element_text(size = 16), 
        legend.text = element_text(size = 12, colour = "black"), 
        axis.text.y = element_text(colour = "black", size = 12)) + 
  scale_y_continuous(expand = c(0,0)) + 
  labs(x = "", y = "Frequency of use of diagrams (%)", fill = "Experience") + 
  scale_fill_manual(values = colours)

mx
