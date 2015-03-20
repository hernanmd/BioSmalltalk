accessing hsps
selectHspBitScores
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspBitScores size > 1
		ifFalse: [ self hspBitScores anyOne blastValue ]
		ifTrue: [ (self hspBitScores detectMax: [: e | e blastValue asNumber ]) blastValue asNumber ]