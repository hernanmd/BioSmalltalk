hsps accessing
selectHspPositive
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer the one with the highest percent alignment. "
	
	^ self hspPositives size > 1
		ifFalse: [ self hspPositives anyOne blastValue ]
		ifTrue: [ ( self hspPositives detectMax: [: positive | positive blastValue asNumber ] ) blastValue asNumber ]