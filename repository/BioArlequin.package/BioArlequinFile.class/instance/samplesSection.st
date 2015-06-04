sections
samplesSection
	" Private - Answer the receiver's [Samples] section "
	
	^ samplesSection
		ifNil: [ samplesSection := self newSamplesSection ].
