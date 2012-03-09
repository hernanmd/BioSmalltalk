*BioTools
asCondensedString
	"Return a copy of the receiver with leading/trailing blanks removed
	 and white spaces condensed."

	^ self withoutBlanks withoutCRs
