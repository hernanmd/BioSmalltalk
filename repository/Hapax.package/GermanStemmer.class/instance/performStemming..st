private-algorithm
performStemming: aString

	string := aString.
	self toLowercase.
	self preprocessing.
	self setMarks.
	self step1.
	self step2.
	self step3.
	self toLowercase.
	"string := string replaceAll: $¦§ with: $a.
	string := string replaceAll: $¦ with: $o.
	string := string replaceAll: $¦º with: $u."

	^string

	"German includes the following accented forms, 
		¦§   ¦   ¦º 
	and a special letter, ¦ü, equivalent to double s. 

	The following letters are vowels: 
		a   e   i   o   u   y   ¦§   ¦   ¦º 
	First, replace ¦ü by ss, and put u and y between vowels into upper case. R1 and R2 are first set up in the standard way (see the note on R1 and R2), but then R1 is adjusted so that the region before it contains at least 3 letters. 

	Define a valid s-ending as one of b, d, f, g, h, k, l, m, n, r or t. 

	Define a valid st-ending as the same list, excluding letter r. 

	Do each of steps 1, 2 and 3. 

	Step 1: 
	Search for the longest among the following suffixes, 

		(a) e   em   en   ern   er   es
		(b) s (preceded by a valid s-ending) 

	and delete if in R1. (Of course the letter of the valid s-ending is not necessarily in R1) 
	(For example, ¦§ckern -> ¦§ck, ackers -> acker, armes -> arm) 

	Step 2: 
	Search for the longest among the following suffixes, 

		(a) en   er   est
		(b) st (preceded by a valid st-ending, itself preceded by at least 3 letters) 

	and delete if in R1. 
	(For example, derbsten -> derbst by step 1, and derbst -> derb by step 2, since b is a valid st-ending, and is preceded by just 3 letters) 

	Step 3:
	Search for the longest among the following suffixes, and perform the action indicated. 

	end   ung 
		delete if in R2 
		if preceded by ig, delete if in R2 and not preceded by e 

	ig   ik   isch 
		delete if in R2 and not preceded by e 

	lich   heit 
		delete if in R2 
		if preceded by er or en, delete if in R1 

	keit 
		delete if in R2 
		if preceded by lich or ig, delete if in R2 

	Finally, 
	turn U and Y back into lower case, and remove the umlaut accent from a, o and u."