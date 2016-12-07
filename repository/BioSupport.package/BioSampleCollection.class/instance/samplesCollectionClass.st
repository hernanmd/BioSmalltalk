accessing
samplesCollectionClass
	" Answer a <Class> responsible for storing the receiver's samples "
	
	^ samplesCollectionClass
		ifNil: [ samplesCollectionClass := self defaultSamplesCollectionClass ]