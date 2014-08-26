accessing hsps
selectHspAlign
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspAlignLengths size > 1
		ifFalse: [ self hspAlignLengths anyOne blastValue ]
		ifTrue: [ ( self hspAlignLengths detectMax: [: align | align blastValue asNumber ] ) blastValue asNumber ]