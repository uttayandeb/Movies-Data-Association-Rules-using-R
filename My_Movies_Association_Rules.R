################ Packages Required ##########


library(rmarkdown)
library(arules)
library(arulesViz)
#install.packages("igraph")
library(igraph)


########### Understanding and reading the data #####

mymovies <- read.csv(file.choose())

View(mymovies)
colnames(mymovies)
nrow(mymovies)
ncol(mymovies)
str(mymovies)

rules <- apriori(as.matrix(mymovies[,6:15],parameter=list(support=0.2, confidence = 0.5,minlen=5)))


rules

inspect(head(sort(rules, by = "lift")))

head(quality(rules))


########### Exploratory data Analysis ###########

plot(rules,method = "scatterplot")


plot(rules, method = "grouped")




plot(rules,method = "graph")
