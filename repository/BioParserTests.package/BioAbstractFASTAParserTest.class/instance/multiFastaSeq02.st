samples-multi
multiFastaSeq02
	" From http://www.dalkescientific.com/writings/NBN/parsing.html 
	
	thisContext receiver new multiFastaSeq02
	"

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self multiFastaSeq02Header01; cr;
			nextPutAll: self multiFastaSeq02Body01; cr;
			nextPutAll: self multiFastaSeq02Header02; cr;
			nextPutAll: self multiFastaSeq02Body02; cr;
			nextPutAll: self multiFastaSeq02Header03; cr;
			nextPutAll: self multiFastaSeq02Body03
		].