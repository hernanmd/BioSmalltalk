Class {
	#name : #BioAlphabetTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'alphabet'
	],
	#category : 'BioToolsTests-Biological'
}

{ #category : #testing }
BioAlphabetTest >> testLetters01DNA [

	self assert: (BioIUPACUnambiguousDNA 	new codes bioHasEqualElements: 'GATCN').
	self assert: (BioIUPACAmbiguousDNA 		new codes bioHasEqualElements: 'GATCRYWSMKHBVDN' ).
	self assert: (BioIUPACDNAExtended 		new codes bioHasEqualElements: 'GATCBDSW').

	
]

{ #category : #testing }
BioAlphabetTest >> testLetters02RNA [

	self assert: BioIUPACAmbiguousRNA new codes asSet =  'GAUCRYWSMKHBVDN' asSet.
	self assert: BioIUPACUnambiguousRNA new codes asSet = 'GAUC' asSet.

	
]

{ #category : #testing }
BioAlphabetTest >> testLetters03Protein [

	self assert: BioIUPACProtein new codes asSet = 'ACDEFGHIKLMNPQRSTVWY' asSet.
	self assert: BioIUPACProteinExtended new codes asSet = 'ACDEFGHIKLMNPQRSTVWYBXZJUO' asSet.

	
]

{ #category : #testing }
BioAlphabetTest >> testLetters04AminoacidNames [

	self assert: $A asAminoacidName = 'Alanine'.
	self assert: $R asAminoacidName = 'Arginine'.
	self assert: $N asAminoacidName = 'Asparagine'.
	self assert: $D asAminoacidName = 'Aspartic Acid'.
	self assert: $C asAminoacidName = 'Cysteine'.
	self assert: $E asAminoacidName = 'Glutamic Acid'.
	self assert: $Q asAminoacidName = 'Glutamine'.
	self assert: $G asAminoacidName = 'Glycine'.
	self assert: $H asAminoacidName = 'Histidine'.
	self assert: $I asAminoacidName = 'Isoleucine'.
	self assert: $L asAminoacidName = 'Leucine'.
	self assert: $K asAminoacidName = 'Lysine'.
	self assert: $M asAminoacidName = 'Methionine'.
	self assert: $F asAminoacidName = 'Phenylalanine'.
	self assert: $P asAminoacidName = 'Proline'.
	self assert: $S asAminoacidName = 'Serine'.
	self assert: $T asAminoacidName = 'Threonine'.
	self assert: $W asAminoacidName = 'Tryptophan'.
	self assert: $Y asAminoacidName = 'Tyrosine'.
	self assert: $V asAminoacidName = 'Valine'.
	
	self assert: $a asAminoacidName = 'Alanine'.
	self assert: $r asAminoacidName = 'Arginine'.
	self assert: $n asAminoacidName = 'Asparagine'.
	self assert: $d asAminoacidName = 'Aspartic Acid'.
	self assert: $c asAminoacidName = 'Cysteine'.
	self assert: $e asAminoacidName = 'Glutamic Acid'.
	self assert: $q asAminoacidName = 'Glutamine'.
	self assert: $g asAminoacidName = 'Glycine'.
	self assert: $h asAminoacidName = 'Histidine'.
	self assert: $i asAminoacidName = 'Isoleucine'.
	self assert: $l asAminoacidName = 'Leucine'.
	self assert: $k asAminoacidName = 'Lysine'.
	self assert: $m asAminoacidName = 'Methionine'.
	self assert: $f asAminoacidName = 'Phenylalanine'.
	self assert: $p asAminoacidName = 'Proline'.
	self assert: $s asAminoacidName = 'Serine'.
	self assert: $t asAminoacidName = 'Threonine'.
	self assert: $w asAminoacidName = 'Tryptophan'.
	self assert: $y asAminoacidName = 'Tyrosine'.
	self assert: $v asAminoacidName = 'Valine'.

	self assert: 'A' asAminoacidName = 'Alanine'.
	self assert: 'R' asAminoacidName = 'Arginine'.
	self assert: 'N' asAminoacidName = 'Asparagine'.
	self assert: 'D' asAminoacidName = 'Aspartic Acid'.
	self assert: 'C' asAminoacidName = 'Cysteine'.
	self assert: 'E' asAminoacidName = 'Glutamic Acid'.
	self assert: 'Q' asAminoacidName = 'Glutamine'.
	self assert: 'G' asAminoacidName = 'Glycine'.
	self assert: 'H' asAminoacidName = 'Histidine'.
	self assert: 'I' asAminoacidName = 'Isoleucine'.
	self assert: 'L' asAminoacidName = 'Leucine'.
	self assert: 'K' asAminoacidName = 'Lysine'.
	self assert: 'M' asAminoacidName = 'Methionine'.
	self assert: 'F' asAminoacidName = 'Phenylalanine'.
	self assert: 'P' asAminoacidName = 'Proline'.
	self assert: 'S' asAminoacidName = 'Serine'.
	self assert: 'T' asAminoacidName = 'Threonine'.
	self assert: 'W' asAminoacidName = 'Tryptophan'.
	self assert: 'Y' asAminoacidName = 'Tyrosine'.
	self assert: 'V' asAminoacidName = 'Valine'.

	self assert: 'a' asAminoacidName = 'Alanine'.
	self assert: 'r' asAminoacidName = 'Arginine'.
	self assert: 'n' asAminoacidName = 'Asparagine'.
	self assert: 'd' asAminoacidName = 'Aspartic Acid'.
	self assert: 'c' asAminoacidName = 'Cysteine'.
	self assert: 'e' asAminoacidName = 'Glutamic Acid'.
	self assert: 'q' asAminoacidName = 'Glutamine'.
	self assert: 'g' asAminoacidName = 'Glycine'.
	self assert: 'h' asAminoacidName = 'Histidine'.
	self assert: 'i' asAminoacidName = 'Isoleucine'.
	self assert: 'l' asAminoacidName = 'Leucine'.
	self assert: 'k' asAminoacidName = 'Lysine'.
	self assert: 'm' asAminoacidName = 'Methionine'.
	self assert: 'f' asAminoacidName = 'Phenylalanine'.
	self assert: 'p' asAminoacidName = 'Proline'.
	self assert: 's' asAminoacidName = 'Serine'.
	self assert: 't' asAminoacidName = 'Threonine'.
	self assert: 'w' asAminoacidName = 'Tryptophan'.
	self assert: 'y' asAminoacidName = 'Tyrosine'.
	self assert: 'v' asAminoacidName = 'Valine'.

	self assert: 'ALA' asAminoacidName = 'Alanine'.
	self assert: 'Arg' asAminoacidName = 'Arginine'.
	self assert: 'asn' asAminoacidName = 'Asparagine'.
	self assert: 'aSP' asAminoacidName = 'Aspartic Acid'.
	self assert: 'cyS' asAminoacidName = 'Cysteine'.
	self assert: 'GLU' asAminoacidName = 'Glutamic Acid'.
	self assert: 'GLN' asAminoacidName = 'Glutamine'.
	self assert: 'GLY' asAminoacidName = 'Glycine'.
	self assert: 'HIS' asAminoacidName = 'Histidine'.
	self assert: 'ILE' asAminoacidName = 'Isoleucine'.
	self assert: 'LEU' asAminoacidName = 'Leucine'.
	self assert: 'LYS' asAminoacidName = 'Lysine'.
	self assert: 'MET' asAminoacidName = 'Methionine'.
	self assert: 'PHE' asAminoacidName = 'Phenylalanine'.
	self assert: 'PRO' asAminoacidName = 'Proline'.
	self assert: 'SER' asAminoacidName = 'Serine'.
	self assert: 'THR' asAminoacidName = 'Threonine'.
	self assert: 'TRP' asAminoacidName = 'Tryptophan'.
	self assert: 'TYR' asAminoacidName = 'Tyrosine'.
	self assert: 'VAL' asAminoacidName = 'Valine'.
]

{ #category : #testing }
BioAlphabetTest >> testTranslation [

	self assert: ( BioIUPACDNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACRNA		withAllSubclasses allSatisfy: [: alpha | alpha new canTranslate ] ).
	self assert: ( BioIUPACProtein	withAllSubclasses noneSatisfy: [: alpha | alpha new canTranslate ] ).
	
]
