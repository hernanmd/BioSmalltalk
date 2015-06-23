*BioSupport
associationsDo: aBlock displayingProgress: aStringOrBlock
	"Evaluate aBlock for each of the receiver's elements (key/value associations)."

	tally = 0 ifTrue: [^ self].
	^ self associationsDo: aBlock displayingProgress: aStringOrBlock every: 20	
