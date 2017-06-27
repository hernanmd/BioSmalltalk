accessing
populatedRepositories
	" Answer a <Collection> of <BioPopRepository> which are already populated  "

	^ self repositories reject: #isEmpty