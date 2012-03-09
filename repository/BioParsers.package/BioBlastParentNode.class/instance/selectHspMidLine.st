hsps accessing
selectHspMidLine
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspMidLines size > 1
		ifFalse: [ self hspMidLines anyOne blastValue ]
		ifTrue: [ ( self hspMidLines detectMax: [: hspMidLine | hspMidLine blastValue size ] ) blastValue ]