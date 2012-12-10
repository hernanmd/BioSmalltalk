As yet unclassified
min

	^(self reject: #isNil) 
		inject: SmallInteger maxVal "Unlimited positive" 
		into: [ :each :min | min min: each ]