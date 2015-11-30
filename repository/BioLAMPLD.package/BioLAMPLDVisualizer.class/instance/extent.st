accessing
extent

	^ extent
		ifNil: [ extent := self defaultExtent ]