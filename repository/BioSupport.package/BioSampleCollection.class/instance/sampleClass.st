accessing
sampleClass
	" Answer a <Class> associated with the receiver's individual samples "

	^ sampleClass
		ifNil: [ sampleClass := self defaultSampleClass ]