Extension { #name : #Integer }

{ #category : #'*biotools' }
Integer >> alignmentAt: aBioAlignment [

	^ aBioAlignment atAlignment: self
]

{ #category : #'*BioTools' }
Integer >> atColumnFromBioAlignment: aBioAlignment [ 
	" See comment in BioAlignment>>atColumn: "

	^ (self between: 1 and: aBioAlignment alignMaxSize)
		ifTrue: [ (aBioAlignment collect: [ : seq | seq at: self ]) joinUsing: String empty ]
		ifFalse: [ self signalInvalidObject: self asString , ' is out of range in the receiver''s sequences' ]
]

{ #category : #'*biotools' }
Integer >> choose: r [
	" Calculate n!/(r! * (n-r)!) where n is the receiver "

	^ self factorial / (r factorial * (self - r) factorial)
]
