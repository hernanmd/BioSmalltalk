initialize-release
sanityCheck

	self gtLog: self class asString , ' was initialized ok?...' , self breeds isEmpty not asString.
	self gtLog: 'breeds: ' , self breeds size asString.