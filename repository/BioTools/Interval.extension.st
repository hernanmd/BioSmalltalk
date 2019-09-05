Extension { #name : #Interval }

{ #category : #'*biotools' }
Interval >> alignmentAt: aBioAlignment [

	^ aBioAlignment atAlignments: self
]
