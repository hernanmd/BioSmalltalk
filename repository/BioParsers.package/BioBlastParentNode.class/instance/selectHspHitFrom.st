extracting - hsps
selectHspHitFrom
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspHitFrom size > 1
		ifFalse: [ self hspHitFrom anyOne blastValue ]
		ifTrue: [ (self hspHitFrom detectMax: [: hspHitFrom | hspHitFrom blastValue size ]) blastValue ]