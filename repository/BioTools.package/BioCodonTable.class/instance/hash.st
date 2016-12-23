comparing
hash
	" Private - hash is implemented because #= is implemented "
	
	^ self table hash bitXor: (self startCodons hash bitXor: self stopCodons hash)