accessing
frequencies
	" Answer a Collection with the receiver's frequencies "
	
	^ frequencies
		ifNil: [ 
			frequencies := 
				self 
					generate: '1' 
					repeat: matrix numberOfRows - self positionCiphers - 1 ].

	