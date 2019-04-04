import sys

flank_left = 10
flank_right = 16
hex_len = 6
base_pairs = ["AT", "TA", "GC", "CG"]


def get_flank(kmers, seqs):
    flank_left_list = []
    flank_right_list = []
    for i in range(len(kmers)):
        idx = seqs[i].find(kmers[i])
        if (idx+flank_right > len(seqs[i])):
            temp_left = len(seqs[i])-(idx+hex_len)
            flank_seq_left = seqs[i][idx-temp_left:idx]
            flank_seq_right = seqs[i][idx+hex_len:len(seqs[i])]
        else:
            flank_seq_left = seqs[i][idx-10:idx]
            flank_seq_right = seqs[i][idx+hex_len:idx+flank_right]
        flank_left_list.append(flank_seq_left)
        flank_right_list.append(flank_seq_right)
        #hamming_for_bp(flank_seq_left, flank_seq_right)
    
    return [flank_left_list, flank_right_list]

def hamming(str1, str2):
    print(str1)
    print(str2)
    dist  = 0
    L = len(str1)
    for i in range(L):
        if str1[i] != str2[i]:
            dist += 1
    print(dist)
    return dist

def hamming_for_bp(str1,str2):
    print(str1)
    rev_str2 = str2[::-1]
    print(rev_str2)
    dist = 0
    L = len(str1)
    for i in range(L):
        if (str1[i] + rev_str2[i]) not in base_pairs:
            dist +=1
    print(dist)
    return dist
    
def count_seqs(seq_list):
    seq_dict = {}
    for seq in seq_list:
        if seq not in seq_dict:
            seq_dict[seq] = 1
        else:
            seq_dict[seq] += 1

    return seq_dict


def main():
    
    kmer_list = []
    seqs_list = []
    m = open(sys.argv[1],'r')
    first_line = m.readline()
    for line in m:
        line = line.replace("\t", ',')
        line = line.replace("\n", '')
        temp = line.split(",",1)
        kmer_list.append(temp[0])
        seqs_list.append(temp[1])
    m.close()
    l = get_flank(kmer_list,seqs_list)
    print(l[0][1:5])
    dict = count_seqs(l[1])
    print(dict)
    print(max(dict, key = dict.get))

if __name__ == "__main__":
    main()
