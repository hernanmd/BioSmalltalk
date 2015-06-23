private
buildGroupSamples

	groupSamples := self data collect: [ : classAssoc |
		classAssoc key -> (self buildSamplesFromGroupedDictionaries: classAssoc value ) ].
	^  BioA31Group fromBuilder: self.