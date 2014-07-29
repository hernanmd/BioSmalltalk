hsps accessing
selectHspEValue
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspEValues size > 1
		ifFalse: [ self hspEValues anyOne blastValue ]
		ifTrue: [ (self hspEValues detectMax: [: e | e blastValue asNumber ]) blastValue asNumber ]