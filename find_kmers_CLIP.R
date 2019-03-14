

kmers <- read.table("k-mers-table.txt", header = TRUE, sep = "\t")
print(head(kmers))

hexamer_t <- gsub("U", "T",kmers$hexamer)
print(head(hexamer_t))

kmers$hexamer_t <- hexamer_t
print(head(kmers))
 
sequences <- read.table("FMR1_sequences.fa.out", header = TRUE, sep = "\t")
print(head(sequences))

odds <- seq(1,nrow(sequences),2)
print(head(odds))

sequences <- sequences[odds,]
print(head(sequences))

alphabet = c("A","G","C","T")

createRandString<- function() {
  v = c(sample(alphabet, 6, replace = TRUE))
  return(paste0(v,collapse = ""))
}


rbps_seqs_idx <- which(kmers$rbps == "FMR1")
rbps_seqs <- kmers$hexamer_t[rbps_seqs_idx]
print((rbps_seqs))

rands <- c()
for(i in 1:length(rbps_seqs)){
      rands <- c(rands, createRandString())
}

print(rands)

count <- 0
kmer <- c()
seq <- c()
rand_count <- 0
for(i in 1:length(sequences)){
      for( j in 1:length(rbps_seqs)){
      	   if ((grepl(tolower(rbps_seqs[j]),tolower(sequences[i]))) == TRUE){
	      count = count + 1
	      kmer <- c(kmer, toupper(rbps_seqs[j]))
	      seq <- c(seq, toupper(sequences[i]))    	      
	   }
	  if ((grepl(tolower(rands[j]),tolower(sequences[i]))) == TRUE){
              rand_count = rand_count + 1
           } 
	   
	   }
}

data <- data.frame(kmer, seq)
print(count)
print(rand_count)
print(length(sequences))
print(head(data))
