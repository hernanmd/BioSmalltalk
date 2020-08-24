Extension { #name : #Interval }

{ #category : #'*biotools' }
Interval >> alignmentAt: aBioAlignment [

	^ aBioAlignment atAlignments: self
]

{ #category : #'*BioTools' }
Interval >> atColumnFromBioAlignment: aBioAlignment [ 
	" See comment in BioAlignment>>atColumn: "

	^ (start >= 0 and: [ stop <= aBioAlignment alignMaxSize ])
		ifTrue: [ self shouldBeImplemented ]
		ifFalse: [ self signalInvalidObject: self asString , ' is out of range in the receiver''s sequences' ]
]
