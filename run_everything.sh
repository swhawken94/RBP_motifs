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

# convert transite motif excel file to csv table to read into subsequent script
Rscript convert_xlsx.R

# script that searches for RBP motif in CLIP-seq data
Rscript find_kmers_CLIP.R FMR1_sequences.fa.out

######################################################                                                                                  
#### Get IGF2BP2  fasta sequences from CLIP peaks ####                                                                                              
######################################################


cat ENCFF082VUD.bed ENCFF988HSD.bed > IGF2BP2_peaks.bed
rm ENCFF988HSD.bed
rm ENCFF082VUD.bed

bedtools getfasta -fi whole_genome38.fa -bed IGF2BP2_peaks.bed  -fo IGF2BP2_sequences.fa.out

Rscript find_kmers_CLIP.R IGF2BP2_sequences.fa.out

######################################################                                                                                     
#### Get IGF2BP3 fasta sequences from CLIP peaks ####                                                                              
###################################################### 

cat ENCFF076GHL.bed ENCFF886SDQ.bed ENCFF998WZW.bed > IGF2BP3_peaks.bed

rm ENCFF076GHL.bed
rm ENCFF886SDQ.bed
rm ENCFF998WZW.bed

bedtools getfasta -fi whole_genome38.fa -bed IGF2BP3_peaks.bed  -fo IGF2BP3_sequences.fa.out

Rscript find_kmers_CLIP.R IGF2BP3_sequences.fa.out

######################################################                                                                    
#### Get KHDRBS1 fasta sequences from CLIP peaks ####                              
######################################################

cat ENCFF027UTH.bed ENCFF214SWT.bed ENCFF738QUP.bed > KHDRBS1_peaks.bed

rm ENCFF027UTH.bed
rm ENCFF214SWT.bed
rm ENCFF738QUP.bed

bedtools getfasta -fi whole_genome38.fa -bed KHDRBS1_peaks.bed  -fo KHDRBS1_sequences.fa.out

Rscript find_kmers_CLIP.R KHDRBS1_sequences.fa.out

######################################################                                                                                    #### Get LIN28B fasta sequences from CLIP peaks ####                                                                                      
######################################################

cat ENCFF246BGL.bed ENCFF341XMP.bed ENCFF909VPB.bed > LIN28B_peaks.bed

rm ENCFF909VPB.bed
rm ENCFF246BGL.bed
rm ENCFF341XMP.bed

bedtools getfasta -fi whole_genome38.fa -bed LIN28B_peaks.bed  -fo LIN28B_sequences.fa.out

Rscript find_kmers_CLIP.R LIN28B_sequences.fa.out

######################################################                                                                     
#### Get PCBP2 fasta sequences from CLIP peaks ####                                                                      
######################################################  

cat ENCFF454MWQ.bed ENCFF514GGZ.bed ENCFF642GNE.bed > PCBP2_peaks.bed

rm ENCFF454MWQ.bed
rm ENCFF514GGZ.bed
rm ENCFF642GNE.bed

bedtools getfasta -fi whole_genome38.fa -bed PCBP2_peaks.bed  -fo PCBP2_sequences.fa.out

Rscript find_kmers_CLIP.R PCBP2_sequences.fa.out

######################################################                                                                     
#### Get PTBP1 fasta sequences from CLIP peaks ####                                                                      
######################################################  

cat ENCFF594PWG.bed ENCFF894KLP.bed ENCFF907HNN.bed > PTBP1_peaks.bed
rm ENCFF907HNN.bed
rm ENCFF894KLP.bed
rm ENCFF594PWG.bed 

bedtools getfasta -fi whole_genome38.fa -bed PTBP1_peaks.bed  -fo PTBP1_sequences.fa.out

Rscript find_kmers_CLIP.R PTBP1_sequences.fa.out

######################################################                                                                                 
#### Get RBM5 fasta sequences from CLIP peaks ####                                                                                      
###################################################### 

cat ENCFF176RGG.bed ENCFF927KRA.bed ENCFF998ACW.bed > RBM5_peaks.bed
rm ENCFF998ACW.bed
rm ENCFF176RGG.bed
rm ENCFF927KRA.bed

bedtools getfasta -fi whole_genome38.fa -bed RBM5_peaks.bed  -fo RBM5_sequences.fa.out

Rscript find_kmers_CLIP.R RBM5_sequences.fa.out

######################################################                                                                                    #### Get SF3B4 fasta sequences from CLIP peaks ####                                                                                        ######################################################                                                                                   


cat ENCFF073IJF.bed ENCFF232FWK.bed ENCFF744CKU.bed > SF3B4_peaks.bed
rm ENCFF744CKU.bed
rm ENCFF073IJF.bed
rm ENCFF232FWK.bed

bedtools getfasta -fi whole_genome38.fa -bed SF3B4_peaks.bed  -fo SF3B4_sequences.fa.out

Rscript find_kmers_CLIP.R SF3B4_sequences.fa.out

######################################################                                                                                    #### Get SRSF9 fasta sequences from CLIP peaks ####                                                                                      
###################################################### 

cat ENCFF327JJE.bed ENCFF432ASF.bed ENCFF765PIF.bed > SRSF9_peaks.bed

rm ENCFF765PIF.bed
rm ENCFF327JJE.bed
rm ENCFF432ASF.bed

bedtools getfasta -fi whole_genome38.fa -bed SRSF9_peaks.bed  -fo SRSF9_sequences.fa.out

Rscript find_kmers_CLIP.R SRSF9_sequences.fa.out


######################################################                                                                                  #### Get TARDBP fasta sequences from CLIP peaks ####                                                                                   
######################################################

cat ENCFF037TVC.bed ENCFF606RXB.bed ENCFF669TNM.bed > TARDBP_peaks.bed
rm ENCFF669TNM.bed
rm ENCFF037TVC.bed
rm ENCFF606RXB.bed

bedtools getfasta -fi whole_genome38.fa -bed TARDBP_peaks.bed  -fo TARDBP_sequences.fa.out

Rscript find_kmers_CLIP.R TARDBP_sequences.fa.out

###################################################### 
### Get TIA1 fasta sequences from CLIP peaks ####                                                                                        ######################################################

cat ENCFF378HWC.bed ENCFF759KCD.bed ENCFF856EHA.bed > TIA1_peaks.bed
rm ENCFF856EHA.bed
rm ENCFF378HWC.bed
rm ENCFF759KCD.bed

bedtools getfasta -fi whole_genome38.fa -bed TIA1_peaks.bed  -fo TIA1_sequences.fa.out

Rscript find_kmers_CLIP.R TIA1_sequences.fa.out


