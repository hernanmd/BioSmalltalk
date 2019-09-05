Extension { #name : #ZnEncodedStream }

{ #category : #'*BioTools' }
ZnEncodedStream >> bioCr [
	"Append a return character to the receiver accordingly to the platform the receiver is executing in."

	self perform: BioOSInterfaceEngine lineEndConvention
]
