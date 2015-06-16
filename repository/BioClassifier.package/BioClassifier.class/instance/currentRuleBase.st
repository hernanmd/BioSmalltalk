accessing
currentRuleBase
	" Answer an instance of receiver's rule container <BioRuleBase> "
	^ currentRuleBase
		ifNil: [ currentRuleBase := self defaultRuleBase ]