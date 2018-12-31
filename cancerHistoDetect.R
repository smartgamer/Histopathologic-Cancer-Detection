

setwd("~/mygit/Histopathologic-Cancer-Detection")

library(tidyverse)
# install.packages("rio")
library(rio)
# install_formats()

trainlabel = import("/media/upsman/dataDrive/kaggleData/histCancer/train_labels.csv")
summary(trainlabel)
head(trainlabel)
str(trainlabel)
sampleSub=import("/media/upsman/dataDrive/kaggleData/histCancer/sample_submission.csv")
summary(sampleSub)
head(sampleSub)

trainFileList <- list.files("/media/upsman/dataDrive/kaggleData/histCancer/train")
head(trainFileList)
getwd()
setwd("/media/upsman/dataDrive/kaggleData/histCancer/train")
for (file in trainFileList){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.table(file)
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.table(file)
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
  
}

# install.packages("fftwtools", dependencies = T)
# install.packages("tiff", dependencies = T)

library(tiff)
library(fftwtools)


# source("https://bioconductor.org/biocLite.R")
# biocLite("EBImage")

library(EBImage)
image_dir = "/media/upsman/dataDrive/kaggleData/histCancer/train"
for (file in trainFileList){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- readImage(file.path(image_dir, file))
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-readImage(file.path(image_dir, file))
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
}


