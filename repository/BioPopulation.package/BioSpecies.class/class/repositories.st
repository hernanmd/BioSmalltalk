accessing
repositories
	" Answer a <Collection> of <BioPopRepository> "

	^ Repositories
		ifNil: [ Repositories := OrderedCollection new ]