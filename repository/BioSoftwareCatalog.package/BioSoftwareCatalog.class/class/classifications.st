accessing
classifications
	" Answer a <Collection> of <String> representing classifications applicable to receiver's items "

	^ Classifications
		ifNil: [ Classifications := self initializeClassifications ]