accessing
readReducedProbesFrom: csvFilename
	" 
	Compare two sorted affy CSV files exported from #sortByColumnsAt: line by line
	Does not check order (assume already sorted CSV files) "
	
	^ csvFilename asFileReference readStreamDo: [ : fileStream |
		ZnBufferedReadStream on: fileStream do: [ : readStream |
			(NeoCSVReader on: readStream)
            separator: self delimiter;
				recordClass: BioAffyTXTReducedRecord;
            addField: #id:;
            addIntegerField: #chr:;
            addIntegerField: #position:;
            upToEnd ] ].