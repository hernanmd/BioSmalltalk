accessing
axisYTitle
	^ axisYTitle
		ifNil: [ axisYTitle := self defaultAxisYTitle ]