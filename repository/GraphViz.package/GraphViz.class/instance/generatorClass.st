accessing
generatorClass

	^ generatorClass ifNil: [generatorClass := self class defaultGeneratorClass]