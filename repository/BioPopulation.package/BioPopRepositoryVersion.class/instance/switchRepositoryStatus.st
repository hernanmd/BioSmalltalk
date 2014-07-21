accessing
switchRepositoryStatus

	self isEmpty
		ifTrue: [ self importer import ]
		ifFalse: [ self bioSpecies: nil. 
			self locatedBioSpecies: nil. ]