extracting - hsps
selectHspIdentity
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer a Number with the one with the highest alignment. "
	
	^ self hspIdentities size > 1
		ifFalse: [ self hspIdentities anyOne blastValue ]
		ifTrue: [ ( self hspIdentities detectMax: [: id | id blastValue asNumber ] ) blastValue asNumber ]