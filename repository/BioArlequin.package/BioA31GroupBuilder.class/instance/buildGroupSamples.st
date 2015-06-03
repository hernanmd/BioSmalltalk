private
buildGroupSamples

	groupSamples := self classifications collect: [ : classAssoc |
		classAssoc key -> (self buildSamplesFromGroupedDictionaries: classAssoc value ) ].
	^  BioA31Group fromBuilder: self.