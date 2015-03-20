accessing
blastCategories

	^ self organization categories select: [: cat | cat beginsWith: 'filtering-blast' ]