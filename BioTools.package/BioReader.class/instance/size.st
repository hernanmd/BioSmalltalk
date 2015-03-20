accessing
size
	"Answer how many elements the receiver contains."

	^ contents
		ifNotNil: [ contents size ]
		ifNil: [ 0 ]