testing
rangeIncludes: posNumber chrLocation: chrNumber
	"Return true if chrNumber and posNumber lies in the interval between start and stop and chromosomic location ."
	
	^ (self start notNil and: [ self end notNil ]) and: [ self chrLocation = chrNumber and: [ self rangeIncludes: posNumber ] ]