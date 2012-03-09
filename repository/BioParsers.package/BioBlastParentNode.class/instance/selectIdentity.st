hsps accessing
selectIdentity
	" Private - Handle the case for multiple HSPs.
	If there are multiple HSPs, this will answer the one with the highest percent identity. "
	
	^ self hspIdentities size > 1
		ifFalse: [ self hspIdentities anyOne blastValue ]
		ifTrue: [ ( self hspIdentities detectMax: [: ident | ident blastValue asNumber ] ) blastValue asNumber ]