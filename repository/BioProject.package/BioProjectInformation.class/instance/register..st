accessing public
register: aBioCommandClass
	" Private - Register aBioCommandClass operation in the receiver "
	
	self history addModification: (aBioCommandClass with: self).