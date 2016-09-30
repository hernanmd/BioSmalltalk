accessing
setRuleClass: ruleClass 
	" See comment in #setRuleClass: 
	Set only a new organization if selected ruleClass is different from current organization "

	self ruleBases 
		detect: [ : rb | rb isKindOf: ruleClass ]
		ifFound: [ : foundRb | self currentRuleBase: foundRb ]
		ifNone: [ 
			self currentRuleBase: (ruleClass newForClassifier: self).
			self ruleBases add: self currentRuleBase ].
	(self organization isKindOf: ruleClass organizationClass)
		ifFalse: [ self organization: ruleClass organizationClass new ]