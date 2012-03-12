testing
test15isPalindrome

	self needsWork.
"	| palindromicSeq nonPalindromicSeq |
	
	palindromicSeq := 		BioSequence newUnambiguousDNA: 'ATGACCGGTTACCGGTCAT'.
	nonPalindromicSeq :=	BioSequence newUnambiguousDNA: 'ATGACCGGTTACCGGACAT'.
	
	self assert: 	palindromicSeq isPalindrome.
	self deny: 	nonPalindromicSeq isPalindrome.

"