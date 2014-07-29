accessing
selectPercentageOverAlignment

	^ self percentageOverAlignment size > 1
		ifFalse: [ self percentageOverAlignment anyOne blastValue ]
		ifTrue: [ ( self percentageOverAlignment detectMax: [: pct | pct blastValue asNumber ] ) blastValue asNumber ]