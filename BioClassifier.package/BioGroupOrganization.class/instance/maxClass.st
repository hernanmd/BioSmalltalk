accessing-output
maxClass
	" Answer the BioOrganization class with most assignments in the receiver's classifier "
	
	^ self contents detectMax: [: each | each classifications size ]