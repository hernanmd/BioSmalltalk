accessing public - utils
trimAmbiguityCodes
	" This method modifies the receiver. Trim off all ambiguity codes "
	
	self ambiguityCodes do: [: ambCharacter |
		self copyWithout: ambCharacter ]
