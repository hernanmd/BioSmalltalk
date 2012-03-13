accessing-output
minClass
	" Answer the BioOrganization class with the fewer assignments in the receiver's classifier "

	^ self contents detectMin: [: each | each classifications size ]