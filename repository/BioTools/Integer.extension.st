Extension { #name : #Integer }

{ #category : #'*biotools' }
Integer >> alignmentAt: aBioAlignment [

	^ aBioAlignment atAlignment: self
]

{ #category : #'*biotools' }
Integer >> choose: r [
	" Calculate n!/(r! * (n-r)!) where n is the receiver "

	^ self factorial / (r factorial * (self - r) factorial)
]
