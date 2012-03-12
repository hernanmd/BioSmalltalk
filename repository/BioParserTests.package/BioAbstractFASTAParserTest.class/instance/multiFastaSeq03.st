samples-multi
multiFastaSeq03
	" From http://www.citizendia.org/FASTA_format 
	
	thisContext receiver new multiFastaSeq03
	"

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self multiFastaSeq03Header01; cr;
			nextPutAll: self multiFastaSeq03Body01; cr;
			nextPutAll: self multiFastaSeq03Header02; cr;
			nextPutAll: self multiFastaSeq03Body02
		].