extracting - hsps
selectHspQSeq
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspQSeqs size > 1
		ifFalse: [ self hspQSeqs anyOne blastValue ]
		ifTrue: [ ( self hspQSeqs detectMax: [: hspq | hspq blastValue size ] ) blastValue ]
