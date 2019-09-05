Extension { #name : #PMMatrix }

{ #category : #'*BioPharo4' }
PMMatrix >> initializeRows: r columns: c [
	"Build empty components for a matrix. No check is made: components are assumed to be orgainized in rows."
	rows := (1 to: r) asPMVector collect: [ : each | PMVector new: c].
]

{ #category : #'*BioPharo4' }
PMMatrix class >> rows: r columns: c [

	^ self new 
		initializeRows: r columns: c;
		yourself.

]
