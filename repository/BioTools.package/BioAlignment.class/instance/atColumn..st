accessing
atColumn: aColumnNumber
	" Answer a Collection with the receiver's sequences at aColumnNumber position "
	
	^ ( aColumnNumber between: 1 and: self alignMaxSize )
		ifTrue: [ ( set collect: [ : seq | seq at: aColumnNumber ] ) joinUsing: String empty ]
		ifFalse: [ self signalInvalidObject: aColumnNumber asString , ' is out of range in the receiver''s sequences' ]