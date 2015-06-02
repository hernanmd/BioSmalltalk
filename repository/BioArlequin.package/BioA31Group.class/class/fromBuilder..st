instance creation
fromBuilder: aGroupBuilder

	^ aGroupBuilder groupSamples collect: [ : group | 
		self 
			named: group key name
			data: ((BioGBA31SampleParameters on: aGroupBuilder) buildSamplesAt: group value) ]