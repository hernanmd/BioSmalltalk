testing
canTranslate
	" Answer <true> if a sequence can be translated using the receiver "
	
	self alphabet canTranslate 
		ifFalse: [ ^ false ].
	( self startCodons includes: ( seq copyFrom: 1 to: 3 ) ) 
		ifFalse: [ 
			self signalInvalidObject: 'First codon is not a start codon: ' , ( seq copyFrom: 1 to: 3 ).
			^ false ].
	( self stopCodons includes: ( seq copyFrom: seq size to: seq size - 3 ) ) 
		ifFalse: [ 
			self signalInvalidObject: 'Last codon is not a stop codon: ' , ( seq copyFrom: seq size to: seq size - 3 ).			
			^ false ].
	seq size \\ 3 ~= 0 
		ifFalse: [ 
			self signalInvalidObject: 'Sequence length is not a multiple of three.' , seq size asString.
			^ false ].
	^ true