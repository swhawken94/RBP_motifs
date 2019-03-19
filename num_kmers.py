import sys

def kmer_count(file, k, kmer_dict):
    final_length = len(file) - k+1
    for i in range(final_length):
        kmer = file[i:i+k]
        if kmer not in kmer_dict:
            kmer_dict[kmer] = 0       
        kmer_dict[kmer] += 1
    return kmer_dict


def main():
    data = []
    m = open("FMR1_sequences.txt", 'r')
    for line in m:
        data.append(line.replace("\n",'').upper())
    m.close()
    print(data[1:5])
    
    kmer_dictionary = {}
    for seq in data:
        kmer_count(seq,6,kmer_dictionary)    
    maximum = max(kmer_dictionary,key = kmer_dictionary.get)
    print(maximum, kmer_dictionary[maximum])
    print(kmer_dictionary["GGACAA"]+kmer_dictionary["GACAAG"]+kmer_dictionary["GGACAG"]+kmer_dictionary["GACAGG"])
    print(sum(kmer_dictionary.values()))

if __name__ == "__main__":
    main()
