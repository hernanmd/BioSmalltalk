extracting - hsps
selectHspNumberOfGaps
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	| gaps |
	^ (gaps := self hspGaps) size > 1
		ifFalse: [ 
			gaps isEmpty 
				ifTrue: [ 'Not present' ]
				ifFalse: [ gaps anyOne blastValue ] ]
		ifTrue: [ (gaps detectMax: [: hspGaps | hspGaps blastValue ]) blastValue ]