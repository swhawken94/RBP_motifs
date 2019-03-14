#!/bin/sh

base="/Users/swilson/Documents/Grad_folder2018/yaffe_lab_rotation/"

#############################
#### Download hg38 fasta ####
#############################

curl -o /Users/swilson/Documents/Grad_folder2018/yaffe_lab_rotation/whole_genome38.fa.gz 'http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz'
gunzip whole_genome38.fa.gz
rm whole_genome38.fa.gz

##################################################
#### Get FMR1 fasta sequences from CLIP peaks ####
##################################################

cat ENCFF457ETB.bed ENCFF845EEJ.bed > FMR1_peaks.bed
rm ENCFF457ETB.bed 
rm ENCFF845EEJ.bed

# Using Bedtools software #

bedtools getfasta -fi whole_genome38.fa -bed FMR1_peaks.bed  -fo FMR1_sequences.fa.out

# convert excel file to csv table
Rscript convert_xlsx.R

######################################################                                                                                                       #### Get IGF2BP2  fasta sequences from CLIP peaks ####                                                                                                       ######################################################

cat ENCFF082VUD.bed ENCFF988HSD.bed > IGF2BP2_peaks.bed
rm ENCFF988HSD.bed
rm ENCFF082VUD.bed

bedtools getfasta -fi whole_genome38.fa -bed IGF2BP2_peaks.bed  -fo IGF2BP2_sequences.fa.out

 