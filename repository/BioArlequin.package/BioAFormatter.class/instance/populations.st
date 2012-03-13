accessing
populations
	"Answer the value of populations"

	^ populations
		ifNil: [ populations := Dictionary new ]