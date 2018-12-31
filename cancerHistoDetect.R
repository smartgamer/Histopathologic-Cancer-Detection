
library(tidyverse)
# install.packages("rio")
library(rio)
# install_formats()

trainlabel = import("/media/upsman/dataDrive/kaggleData/histCancer/train_labels.csv")
summary(trainlabel)
head(trainlabel)
