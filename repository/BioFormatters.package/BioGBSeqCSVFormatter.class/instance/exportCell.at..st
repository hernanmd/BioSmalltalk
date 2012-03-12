accessing
exportCell: dict at: key
	"http://dx.doi.org/10.1016/j.mito.2010.09.005"

	| cellContents |
	
	cellContents := dict at: key ifAbsent: [ '-' ].
	( cellContents beginsWith: '10.' )
		ifTrue: [ cellContents := 'http://dx.doi.org/' , cellContents ].
	stream 
		nextPutAll: cellContents;
		nextPut: self delimiterSourceCharacter