accessing
blastMethods
	" self blastMethods "

	^ self blastCategories gather: [: cat | 
		BioBlastFilter organization listAtCategoryNamed: cat ]