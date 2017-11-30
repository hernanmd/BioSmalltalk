options - filtering
filterFounders
	" Excludes all samples with at least one known parental ID from the current analysis (note that it is not necessary for that parent to be in the current dataset) "

	 ^ self addOption: 'filter-founders'