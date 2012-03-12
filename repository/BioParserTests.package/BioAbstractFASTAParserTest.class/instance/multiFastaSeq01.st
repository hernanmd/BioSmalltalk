samples-multi
multiFastaSeq01
	" From http://www.dalkescientific.com/writings/NBN/parsing.html 
	
	thisContext receiver new multiFastaSeq01 
	"

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self multiFastaSeq01Header01; cr;
			nextPutAll: self multiFastaSeq01Body01; cr;
			nextPutAll: self multiFastaSeq01Header02; cr;
			nextPutAll: self multiFastaSeq01Body02
		].
