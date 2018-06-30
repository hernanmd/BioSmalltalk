testing
testNewPrototype

	| prototype |
	prototype := self sequence newPrototypeWith: self sampleDnaString01.
	self assert: (prototype isKindOf: BioSequence).
	
	self assert: (prototype alphabet isKindOf: self sequence alphabet class).
	self assert: self sequence size equals: prototype size.
	self assert: self sequence asString equals: prototype asString.
	
