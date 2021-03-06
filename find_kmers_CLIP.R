#############################################
#### Map Transite kmers to CLIP-seq data ####
#############################################

args = commandArgs(trailingOnly=TRUE)

# read command line arguments
if (length(args)==0) {
     stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else {
  args[2] = "out.txt"
}

###################
#### Functions ####
###################

# Create random hexamer
alphabet = c("A","G","C","T")

createRandString<- function() {
  v = c(sample(alphabet, 6, replace = TRUE))
  return(paste0(v,collapse = ""))
}

# Read in Transite motifs for all RNA binding proteins
kmers <- read.table("k-mers-table.txt", header = TRUE, sep = "\t")
print(head(kmers))

# Substitute U's for T's to map back to CLIP-seq data
hexamer_t <- gsub("U", "T",kmers$hexamer)
print(head(hexamer_t))

# Add the substituted hexamers back to the main kmer file
kmers$hexamer_t <- hexamer_t
print(head(kmers))
 
# Read in CLIP-seq sequences for protein of interest
sequences <- read.table(args[1], header = TRUE, sep = "\t")
prot_name <- strsplit(args[1],"_")[[1]][1]

odds <- seq(1,nrow(sequences),2)
print(head(odds))

sequences <- sequences[odds,]
file_name <- paste0(prot_name, "_sequences.txt", collapse = " ")
write.table(sequences,file = file_name, sep = "\t", row.names = FALSE, quote = FALSE, col.names = FALSE)
print(head(sequences))
print(length(sequences))
hexamer_count = 0
for(i in 1:length(sequences)){
     num_hexamers = length(strsplit(as.character(sequences[i]),"")[[1]]) - 7
     hexamer_count = hexamer_count + num_hexamers
}
print(hexamer_count)

# Get hexamers for protein of interest
#rbps_seqs_idx <- which(kmers$rbps == prot_name)

rbps_seqs_idx <- which(grepl(tolower(prot_name), tolower(as.character(kmers$rbps))))
rbps_seqs <- kmers$hexamer_t[rbps_seqs_idx]
print((rbps_seqs))

#######################################################
#### Search for RBP hexamers in CLIP-seq sequences ####
#######################################################

count <- 0
kmer <- c()
seq <- c()
for(i in 1:length(sequences)){
      for( j in 1:length(rbps_seqs)){
      	   if ((grepl(tolower(as.character(rbps_seqs[j])),tolower(as.character(sequences[i])))) == TRUE){
	      count = count + 1
	      kmer <- c(kmer, toupper(rbps_seqs[j]))
	      seq <- c(seq, toupper(sequences[i]))    	      
	   }
	}
}

# create table with hexamers and corresponding CLIP-seq sequence
data <- data.frame(kmer, seq)
print(count)
print(length(sequences))
print(head(data))

# write a file with RBP hexamer and CLIP-seq sequence
csv_name <- paste0(prot_name, "_hexamer_CLIP-seq.csv", collapse = " ")
write.table(data, file = csv_name, quote = FALSE, row.names = FALSE, sep = "\t")

##########################################################
#### Search for	random hexamers in CLIP-seq sequences ####
##########################################################

random_data <- c()
for(m in 1:100){
      rand_count <- 0
      rands <- c()
      for(l in 1:length(rbps_seqs)){
      	    rands <- c(rands, createRandString())
	}
print(rands)
	for(i in 1:length(sequences)){
      	  for( j in 1:length(rands)){
	     if ((grepl(tolower(rands[j]),tolower(sequences[i]))) == TRUE){
              rand_count = rand_count + 1
              }
      	   }
	}
	print(m)
	random_data <- c(random_data, rand_count)
	print(rand_count)
}

# Histogram of random data
hist_name <- paste0(prot_name, "hist_random_abline.jpeg", collapse = " ")
jpeg(hist_name)
hist(random_data, breaks = 20)
abline(v=count,col="red")
dev.off()

