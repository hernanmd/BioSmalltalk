accessing
samples
	"Answer the value of samples"

	^ samples
		ifNil: [ samples := BioSampleCollection new: self defaultPopulationSize ]