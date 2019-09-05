"
Abstract superclass grouping IUPAC alphabets behavior.

The International Union of Pure and Applied Chemistry nomenclature which is worldwide the most used chemical nomenclature.

See subclasses for details.

"
Class {
	#name : #BioIUPACAlphabet,
	#superclass : #BioComplementaryAlphabet,
	#classVars : [
		'OneLetterAminoacidNames',
		'OneLetterNucleotideNames',
		'ThreeLetterAminoacidNames',
		'ThreeLetterNucleotideNames'
	],
	#category : #'BioTools-Alphabets'
}

{ #category : #accessing }
BioIUPACAlphabet class >> ambiguousAlphabets [
	" Answer a <Collection> with the ambiguous alphabet subclasses "
	
	^ self allSubclasses select: #isAmbiguousAlphabet
]

{ #category : #'class initialization' }
BioIUPACAlphabet class >> initialize [
	" Private - See superimplementor's comment "
	
	super initialize.
	OneLetterAminoacidNames := self initializeOneLetterAminoacidNames.
	ThreeLetterAminoacidNames := self initializeThreeLetterAminoacidNames.
	OneLetterNucleotideNames := self initializeOneLetterNucleotideNames.
	ThreeLetterNucleotideNames := self initializeThreeLetterNucleotideNames.
]

{ #category : #'initialize-release' }
BioIUPACAlphabet class >> initializeOneLetterAminoacidNames [
	" Private - Answer the one letter mapping from Characters to aminoacid names. "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ Dictionary new 
		at: $A put: 'Alanine';
		at: $R put: 'Arginine';
		at: $N put: 'Asparagine';
		at: $D put: 'Aspartic Acid';
		at: $C put: 'Cysteine';
		at: $E put: 'Glutamic Acid';
		at: $Q put: 'Glutamine';
		at: $G put: 'Glycine';
		at: $H put: 'Histidine';
		at: $I put: 'Isoleucine';
		at: $L put: 'Leucine';
		at: $K put: 'Lysine';
		at: $M put: 'Methionine';
		at: $F put: 'Phenylalanine';
		at: $P put: 'Proline';
		at: $S put: 'Serine';
		at: $T put: 'Threonine';
		at: $W put: 'Tryptophan';
		at: $Y put: 'Tyrosine';
		at: $V put: 'Valine';
		yourself
]

{ #category : #'initialize-release' }
BioIUPACAlphabet class >> initializeOneLetterNucleotideNames [
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
]

{ #category : #'initialize-release' }
BioIUPACAlphabet class >> initializeThreeLetterAminoacidNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ Dictionary new
                at: 'ALA' put: 'Alanine';
                at: 'ARG' put: 'Arginine';
                at: 'ASN' put: 'Asparagine';
                at: 'ASP' put: 'Aspartic Acid';
                at: 'CYS' put: 'Cysteine';
                at: 'GLU' put: 'Glutamic Acid';
                at: 'GLN' put: 'Glutamine';
                at: 'GLY' put: 'Glycine';
                at: 'HIS' put: 'Histidine';
                at: 'ILE' put: 'Isoleucine';
                at: 'LEU' put: 'Leucine';
                at: 'LYS' put: 'Lysine';
                at: 'MET' put: 'Methionine';
                at: 'PHE' put: 'Phenylalanine';
                at: 'PRO' put: 'Proline';
                at: 'SER' put: 'Serine';
                at: 'THR' put: 'Threonine';
                at: 'TRP' put: 'Tryptophan';
                at: 'TYR' put: 'Tyrosine';
                at: 'VAL' put: 'Valine';
			yourself	
]

{ #category : #'initialize-release' }
BioIUPACAlphabet class >> initializeThreeLetterNucleotideNames [

	^ Dictionary new 
		add: 'Ade' -> 'Adenine';
		add: 'Thy' -> 'Thymine';
		add: 'Gua' -> 'Guanine';
		add: 'Cyt' -> 'Cytosine';
		yourself
]

{ #category : #testing }
BioIUPACAlphabet class >> isAmbiguousAlphabet [

	^ false
]

{ #category : #accessing }
BioIUPACAlphabet class >> oneLetterAminoacidNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ OneLetterAminoacidNames
		ifNil: [ self initialize.
				OneLetterAminoacidNames ]
]

{ #category : #accessing }
BioIUPACAlphabet class >> oneLetterAminoacidNames: anObject [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	OneLetterAminoacidNames := anObject
]

{ #category : #'initialize-release' }
BioIUPACAlphabet class >> oneLetterNucleotideNames [

	
]

{ #category : #accessing }
BioIUPACAlphabet class >> oneLetterNucleotideNames: anObject [
	OneLetterNucleotideNames := anObject
]

{ #category : #accessing }
BioIUPACAlphabet class >> threeLetterAminoacidNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ ThreeLetterAminoacidNames
		ifNil: [ self initialize.
				ThreeLetterAminoacidNames ]	
]

{ #category : #accessing }
BioIUPACAlphabet class >> threeLetterAminoacidNames: anObject [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	ThreeLetterAminoacidNames := anObject
]

{ #category : #accessing }
BioIUPACAlphabet class >> threeLetterNucleotideNames [
	^ ThreeLetterNucleotideNames
]

{ #category : #accessing }
BioIUPACAlphabet class >> threeLetterNucleotideNames: anObject [
	ThreeLetterNucleotideNames := anObject
]

{ #category : #accessing }
BioIUPACAlphabet class >> unambiguousAlphabets [
	" Answer a <Collection> with the unambiguous alphabet subclasses "
	
	^ self allSubclasses reject: #isAmbiguousAlphabet
]

{ #category : #printing }
BioIUPACAlphabet >> printOn: aStream [
	" See superimplementor's comment "
	
	aStream 
		nextPutAll: self codes asString between: $[ and: $];
		space;
		nextPutAll: 'IUPAC'
]
