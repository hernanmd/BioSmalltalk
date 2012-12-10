private-algorithm
cache
	"Answer the cache of stemmed words."

	^cache isNil
		ifTrue: [ cache := Dictionary new ] 
		ifFalse: [ cache ]