Extension { #name : #NeoCSVReader }

{ #category : #'*BioPharo3' }
NeoCSVReader >> converter: aTextConverter [
	" This is for cases like 'Invalid utf8 input detected' "
	
	readStream converter: aTextConverter
]

{ #category : #'*BioPharo3' }
NeoCSVReader >> rowsDo: aBlock [
	" Iterate over the receiver performing aBlock on each iteration "
	
	^ self do: aBlock
]
