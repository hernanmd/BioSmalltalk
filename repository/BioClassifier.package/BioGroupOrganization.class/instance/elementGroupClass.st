initialize-release
elementGroupClass

	^ elementGroupClass
		ifNil: [ elementGroupClass := self defaultElementGroupClass ]