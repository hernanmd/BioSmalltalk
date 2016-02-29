accessing
removeSearchResult: aBioNamedObject
	" Remove aBioObject from the receiver's sequences "

	self sequences 
		remove: aBioNamedObject
		ifAbsent: [ self signalNotFound: aBioNamedObject name ]