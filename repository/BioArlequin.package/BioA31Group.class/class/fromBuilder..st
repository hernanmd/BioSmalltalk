instance creation
fromBuilder: aGroupBuilder

	^ aGroupBuilder groupSamples collect: [ : group | 
		self 
			named: group key name
			data: ((BioA31SampleParameters on: aGroupBuilder) buildSamplesAt: group value) ]