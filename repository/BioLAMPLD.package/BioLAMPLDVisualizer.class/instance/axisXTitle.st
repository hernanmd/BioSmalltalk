accessing
axisXTitle
	^ axisXTitle
		ifNil: [ axisXTitle := self defaultAxisXTitle ]