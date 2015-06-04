accessing
ruleBase
	" Answer an instance of receiver's rule container <BioRuleBase> "
	^ ruleBase
		ifNil: [ ruleBase := self defaultRuleBase ]