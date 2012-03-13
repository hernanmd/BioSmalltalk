accessing
sequences
	"Answer the value of sequences"

	^ sequences
		ifNil: [ sequences := OrderedCollection new: 300 ]