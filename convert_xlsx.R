data <- read.table("transite_motifs.csv", sep = ",", header = TRUE)
write.table(data, file = "transite_motifs_final.csv", sep = "\t", quote = FALSE, row.names = FALSE)