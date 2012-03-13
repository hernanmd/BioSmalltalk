accessing
generator

	^ generator ifNil: [generator := self generatorClass newFor: self]