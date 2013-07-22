samples-multi
multiFastaSeq06
	" From http://www.dalkescientific.com/writings/NBN/parsing.html 
	This is the multiFastaSeq01 with additional lines between records
	thisContext receiver new multiFastaSeq06 
	"

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self multiFastaSeq01Header01; cr;
			nextPutAll: self multiFastaSeq01Body01; cr; cr;
			nextPutAll: self multiFastaSeq01Header02; cr;
			nextPutAll: self multiFastaSeq01Body02 ].
