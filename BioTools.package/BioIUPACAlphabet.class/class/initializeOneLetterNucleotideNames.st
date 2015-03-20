initialize-release
initializeOneLetterNucleotideNames
	" Private - Answer the one letter mapping from Characters to aminoacid names.

	http://www.ncbi.nlm.nih.gov/collab/FT/
	
	Authority		Nomenclature Committee of the International Union of Biochemistry 
	Reference		Cornish-Bowden, A.  Nucl Acid Res 13, 3021-3030 (1985)
	Contact			EMBL-EBI
	Scope			Location descriptors 
	
	 "
	
	^ Dictionary new 
		add: $A -> 'Adenine';
		add: $T -> 'Thymine';
		add: $G -> 'Guanine';
		add: $C -> 'Cytosine';
		add: $U -> 'Uracil';

		add: $Y -> 'pYrimidine';
		add: $R -> 'puRine';
		add: $W -> 'Weak';
		add: $S -> 'Strong';
		add: $K -> 'Keto';
		add: $M -> 'aroMatic';

		add: $B -> 'not A';
		add: $D -> 'not C';
		add: $H -> 'not G';
		add: $V -> 'not T';
		yourself