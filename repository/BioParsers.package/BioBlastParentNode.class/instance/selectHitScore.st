accessing hsps
selectHitScore
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHitScores size > 1
		ifFalse: [ self hspHitScores anyOne blastValue ]
		ifTrue: [ (self hspHitScores detectMax: [: e | e blastValue asNumber ]) blastValue asNumber ]