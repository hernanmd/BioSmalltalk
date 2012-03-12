exporting
exportConsensus
	" Private - Write a row representing the	consensus sequence "
	
	stream nextPutAll: 'Consensus'.
	self consensus do: [: letter |
		stream
			nextPut: self delimiterSourceCharacter;
			nextPut: letter ].
	stream cr.