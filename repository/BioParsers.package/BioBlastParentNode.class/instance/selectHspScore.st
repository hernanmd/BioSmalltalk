extracting - hsps
selectHspScore
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "

	^ self hspScores size > 1
		ifFalse: [ self hspScores anyOne blastValue ]
		ifTrue: [ (self hspScores detectMax: [: hspScore | hspScore blastValue asNumber ]) blastValue asNumber ]