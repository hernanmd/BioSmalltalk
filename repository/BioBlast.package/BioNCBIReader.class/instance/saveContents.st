accessing
saveContents

	^ saveContents
		ifNil: [ saveContents := self defaultSaveContents ]