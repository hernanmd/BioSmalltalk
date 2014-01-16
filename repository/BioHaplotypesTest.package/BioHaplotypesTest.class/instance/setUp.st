accessing
setUp 

	self haplotypes: (BioHaplotype readFrom: #( 
	#('CTACTGG' 0.475 'TCCATTA' 0.308 'TCCAATA' 0.200 'TTCATGG' 0.017) 
	#('GATGCAACGATGCGGGT' 0.333 'ACCATGCTAGCTGAAAC' 0.438 'ACCGTGCTAGCTGAAAC' 0.035 'AATGCAACGATGCGGGY' 0.142 'ACCATGCTAGCTGAAAC' 0.027 'AACGGCCTAGCTCAAGT' 0.017) )).

	self haploBlock1: (BioHaplotypeBlock new
		markerNumbers: #(3 7 9 15 23 25 34);
		correlation: 0.95;
		haplotypes: self haplotypes first).
		
	self haploBlock2: (BioHaplotypeBlock new
		markerNumbers: #(43 47 52 60 65 66 67 69 70 71 72 74 78 80 84 86 92);
		haplotypes: self haplotypes second).	