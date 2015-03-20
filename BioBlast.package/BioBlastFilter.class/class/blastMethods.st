accessing
blastMethods
	" self blastMethods "

	^ self blastCategories flatCollect: [: cat | BioBlastFilter organization listAtCategoryNamed: cat ]