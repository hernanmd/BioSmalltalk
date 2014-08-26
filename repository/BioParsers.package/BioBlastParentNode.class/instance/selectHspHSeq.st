accessing hsps
selectHspHSeq
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHSeqs size > 1
		ifFalse: [ self hspHSeqs anyOne blastValue ]
		ifTrue: [ ( self hspHSeqs detectMax: [: hspMidLine | hspMidLine blastValue size ] ) blastValue ]
