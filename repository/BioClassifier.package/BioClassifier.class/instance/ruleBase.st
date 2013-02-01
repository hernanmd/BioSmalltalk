accessing
ruleBase
	^ ruleBase
		ifNil: [ ruleBase := BioRuleBase new ]