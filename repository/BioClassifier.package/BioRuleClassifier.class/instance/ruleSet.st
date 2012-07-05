accessing
ruleSet

	^ ruleSet
		ifNil: [ ruleSet := OrderedCollection new ]