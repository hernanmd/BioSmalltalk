accessing
propertySeparator
	" Answer a <Character> with receiver's properties separator "

	^ propertySeparator
		ifNil: [ propertySeparator := self defaultPropertySeparator ]