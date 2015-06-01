instance creation
fromBuilder: aGroupBuilder

	^ aGroupBuilder groupSamples collect: [ : group | 
		self new
			named: group key name
			data: (BioGBA31SampleParameters on: aGroupBuilder) buildSamples ]