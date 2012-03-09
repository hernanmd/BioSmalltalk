testing
isPalindrome
	" Answer <true> if receiver's sequence is palindrome "
	
	self needsWork.
	^ self asString asUppercase = self reverseComplement asString asUppercase