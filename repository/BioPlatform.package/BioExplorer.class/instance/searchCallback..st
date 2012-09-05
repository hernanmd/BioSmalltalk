user interface
searchCallback: searchString

	| searchMethod |

	searchMethod := #includesLike:.
	self useExactMatch 
		ifTrue: [ searchMethod := #includes: ].
	^ ( rootObject select: [: dict | 
			dict perform: searchMethod with: searchString ] ) explore