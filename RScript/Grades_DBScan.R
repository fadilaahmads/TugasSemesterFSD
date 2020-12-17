#Mengimport dataset ke Rstudio
class.grades <- read.csv("D:/UII/Fundamen Sains Data/Tubes/Tugas Semester FSD/Dataset/class-grades.csv")
#Melihat isi class.grade.csv
View(class.grades)

#Tutorial DBSCAN
#import library
library("fpc")
#set seed
set.seed(123)
#Menampilkan summary dari class.grade
summary(class.grades)
#Assign kolom dari kolom 2 hingga 3 ke var grades
grades <- class.grades[,2:3]
#Melihat plot data dengan item berbentuk lingkaran
plot(grades,pch=16)

db <- dbscan(grades, eps = 6, MinPts = 2)
plot(db,grades, main = "DBSCAN", frame = FALSE)

#Alternatif plot, dapat menggunakan fungsi untuk plot cluster
#dari factoextra.
library(factoextra)
fviz_cluster(db, grades, stand=FALSE, frame = FALSE, geom = "point")

#Melihat lebih detil dari hasil DBSCAN
print(db)

#Melihat Cluster dari setiap data point
db$cluster