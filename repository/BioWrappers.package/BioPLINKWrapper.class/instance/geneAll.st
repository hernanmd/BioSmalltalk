properties - filtering
geneAll
	" Removes variants which aren't in any set (this used to happen automatically in some situations) "

	 ^ self addOption: 'geneAll'