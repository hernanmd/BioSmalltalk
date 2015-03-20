sections
samplesSection
	" Private - Answer the receiver's [Samples] section "
	
	(self includesSection: BioA31SamplesSection notation)
		ifFalse: [ samplesSection := self newSamplesSection ].
	^ samplesSection