Extension { #name : #NeoCSVReader }

{ #category : #'*BioPharo4' }
NeoCSVReader >> converter: aTextConverter [
	" This is for cases like 'Invalid utf8 input detected' "
	
	readStream converter: aTextConverter
]

{ #category : #'*BioPharo4' }
NeoCSVReader >> numRows [
	" Answer how many lines contains the receiver "
	
	| count |
 
	count := 0.
	readStream 
		reset;
		binary.
	readStream contents do: [ :c | c = 10 ifTrue: [ count := count + 1 ] ].
	readStream reset.
	^ count
]

{ #category : #'*BioPharo4' }
NeoCSVReader >> reset [
	"Set the receiver's position to the beginning of the sequence of objects."
	
	^ readStream reset
]

{ #category : #'*BioPharo4' }
NeoCSVReader >> rowsCollect: aBlock [
	" Collect over the receiver performing aBlock on each iteration "
	
	| newCollection |
	newCollection := OrderedCollection new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^ newCollection

]

{ #category : #'*BioPharo4' }
NeoCSVReader >> rowsDo: aBlock [
	" Iterate over the receiver performing aBlock on each iteration "
	
	^ self do: aBlock
]

{ #category : #'*BioPharo4' }
NeoCSVReader >> skipHeader: n [
	" Read a record n times, presumably a header, with the intention of skipping it.
	This should normally be called only at the beginning and only once.
	This sets the fieldCount (but fieldAccessors overrides fieldCount)."

	n timesRepeat: [ self readHeader ]
]

{ #category : #'*BioPharo4' }
NeoCSVReader >> text [

	readStream text
]
