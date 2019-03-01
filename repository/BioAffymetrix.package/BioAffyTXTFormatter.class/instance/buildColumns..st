accessing-columns
buildColumns: indexes
	" Answer a <Collection> with columns at indexes. 

	This is similar to UNIX command : cut -f i1,i2,i3 file 
	"
	[ (NeoCSVReader on: self inputFile asFileReference readStream)
		separator: self delimiter;
		skipHeader: self headerLineCount + 1;
		rowsDo: [ : r | 
			self outputFileStream 
					nextPutAll: ((indexes collect: [ : i | r at: i ]) joinUsing: self delimiter);
					nextPutTerminator ] ]
	ensure: [ self outputFileStream close ]