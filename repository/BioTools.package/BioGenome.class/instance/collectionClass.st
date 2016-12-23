accessing
collectionClass
	" Answer a <Class> used to store the receiver's chromosomes "

	^ collectionClass
		ifNil: [ collectionClass := self defaultCollectionClass ]