initialize-release
initialize
	" Private - See superimplementor's comment "
	
	super initialize.
	OneLetterAminoacidNames := self initializeOneLetterAminoacidNames.
	ThreeLetterAminoacidNames := self initializeThreeLetterAminoacidNames.
	OneLetterNucleotideNames := self initializeOneLetterNucleotideNames.
	ThreeLetterNucleotideNames := self initializeThreeLetterNucleotideNames.