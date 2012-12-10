instance creation
newUsing: aComparisonBlock

	^(super new) 
		initialize;
		setComparisonBlock: aComparisonBlock;
		yourself