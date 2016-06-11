accessing
updateOnDemand

	^ updateOnDemand
		ifNil: [ updateOnDemand := self defaultUpdateOnDemand ]