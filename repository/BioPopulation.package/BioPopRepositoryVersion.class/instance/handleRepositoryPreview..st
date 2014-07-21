accessing
handleRepositoryPreview: aPCTKBSpeciesRepoPreview 

	self isEmpty
		ifFalse: [ aPCTKBSpeciesRepoPreview previewModelItems: self bioSpecies ]
		ifTrue: [ aPCTKBSpeciesRepoPreview  setEmptyPreviewModel ]