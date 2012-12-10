comparing
hash

	^(self size hash bitXor: (self at: 1) hash) bitXor: (self at: self size) hash