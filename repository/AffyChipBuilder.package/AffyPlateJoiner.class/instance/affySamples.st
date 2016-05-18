accessing
affySamples
	^ affySamples
		ifNil: [ affySamples := OrderedCollection new ]