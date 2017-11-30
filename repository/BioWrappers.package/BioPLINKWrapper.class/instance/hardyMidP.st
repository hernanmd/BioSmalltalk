properties - filtering
hardyMidP
	" Writes a list of genotype counts and Hardy-Weinberg equilibrium exact test statistics. A mid-p adjustment is applied. 
	
	When the samples are case/control, three separate sets of Hardy-Weinberg equilibrium statistics are computed: one considering both cases and controls, one considering only cases, and one considering only controls. These are distinguished by 'ALL', 'AFF', and 'UNAFF' in the TEST column, respectively. If the phenotype is quantitative or nonexistent instead, there is just one line per variant, labeled 'ALL(QT)' or 'ALL(NP)' respectively.

By default, only founders are considered when generating this report, so if you are working with e.g. a sibling-only dataset, you won't get any results"

	self propertyAt: 'hardy' ifAbsentPut: [ 'midp' ]