testing
rangeIncludes: aNumber
	"Return true if the number lies in the interval between start and stop."
	
	^ self start notNil and: [ self end notNil and: [ self range rangeIncludes: aNumber ] ]