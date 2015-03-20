instance creation
readFrom: collection
	" collection contains subcollections, each one an haplotype block "
	
	^ collection collect: [ : htCol | 
		htCol pairsCollect: [ : hSeq : hFreq | 
			self new 
				sequence: hSeq; 
				popFreq: hFreq; 
				yourself ] ].