accessing
stem: aString
	"Answer the the morphological root of a word, ie removes its suffix." 

	^self cache at: aString ifAbsentPut: [ self performStemming: aString ]