"
DNA Codon Table in 5' -> 3' direction

Class Instance Variables:
	codonTables	<ProtoObject>
"
Class {
	#name : #BioDNACodonTables,
	#superclass : #BioCodonTables,
	#category : #'BioTools-Biological'
}

{ #category : #tables }
BioDNACodonTables class >> alternativeFlatwormMitochondrialId [
	
	^ 9
]

{ #category : #tables }
BioDNACodonTables class >> alternativeFlatwormMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TAA'-> 'Y'; add: 'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add:
'CTT'-> 'L'; add: 'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add:
'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add:
'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add:
'CGG'-> 'R'; add: 'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add:
'ACT'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add:
'AAC'-> 'N'; add: 'AAA'-> 'N'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add:
'AGA'-> 'S'; add: 'AGG'-> 'S'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add:
'GTG'-> 'V'; add: 'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add:
'GAT'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add:
'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> alternativeFlatwormMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Echinoderm Mitochondrial'
		with: 'Flatworm Mitochondrial'
		with: 'SGC8'
]

{ #category : #tables }
BioDNACodonTables class >> alternativeFlatwormMitochondrialTableStartCodons [
	
	^ OrderedCollection with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> alternativeFlatwormMitochondrialTableStopCodons [
	
	^ OrderedCollection with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> alternativeYeastNuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add: 'CTC'-> 'L'; add:
'CTA'-> 'L'; add: 'CTG'-> 'S'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add:
'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add:
'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'ATT'-> 'I'; add:
'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add: 'ACC'-> 'T'; add:
'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add:
'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add:
'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add: 'GCT'-> 'A'; add:
'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add: 'GAC'-> 'D'; add:
'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add:
'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> alternativeYeastNuclearTableId [
	
	^ 12
]

{ #category : #tables }
BioDNACodonTables class >> alternativeYeastNuclearTableNames [
	
	^ OrderedCollection 
		with: 'Alternative Yeast Nuclear'
]

{ #category : #tables }
BioDNACodonTables class >> alternativeYeastNuclearTableStartCodons [
	
	^ OrderedCollection
		with: 'CTG'
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> alternativeYeastNuclearTableStopCodons [
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> ascidianMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	
	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'M'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'G'; add:
'AGG'-> 'G'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> ascidianMitochondrialTableId [
	
	^ 13
]

{ #category : #tables }
BioDNACodonTables class >> ascidianMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Ascidian Mitochondrial'
]

{ #category : #tables }
BioDNACodonTables class >> ascidianMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'TTG'
		with: 'ATA'
		with: 'ATG'
		with: 'GTG'
]

{ #category : #tables }
BioDNACodonTables class >> ascidianMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> bacterialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add: 'CTC'-> 'L'; add:
'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add:
'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add:
'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'ATT'-> 'I'; add:
'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add: 'ACC'-> 'T'; add:
'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add:
'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add:
'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add: 'GCT'-> 'A'; add:
'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add: 'GAC'-> 'D'; add:
'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add:
'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> bacterialTableId [
	
	^ 11
]

{ #category : #tables }
BioDNACodonTables class >> bacterialTableNames [
	
	^ OrderedCollection 
		with: 'Bacterial and Plant Plastid'
]

{ #category : #tables }
BioDNACodonTables class >> bacterialTableStartCodons [
	
	^ OrderedCollection new 
		addAll: #('TTG' 'CTG' 'ATT' 'ATC' 'ATA' 'ATG' 'GTG');
		yourself
]

{ #category : #tables }
BioDNACodonTables class >> bacterialTableStopCodons [
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> blepharismaMacronuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TAG'-> 'Q'; add: 'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add:
'AGG'-> 'R'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> blepharismaMacronuclearTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 15
]

{ #category : #tables }
BioDNACodonTables class >> blepharismaMacronuclearTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Blepharisma Macronuclear'
]

{ #category : #tables }
BioDNACodonTables class >> blepharismaMacronuclearTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> blepharismaMacronuclearTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'TAA'
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> chlorophyceanMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TAG'-> 'L'; add: 'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add:
'AGG'-> 'R'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> chlorophyceanMitochondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 16
]

{ #category : #tables }
BioDNACodonTables class >> chlorophyceanMitochondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Chlorophycean Mitochondrial'
]

{ #category : #tables }
BioDNACodonTables class >> chlorophyceanMitochondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> chlorophyceanMitochondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'TAA'
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> ciliateNuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TAA'-> 'Q'; add: 'TAG'-> 'Q'; add: 'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGG'-> 'W'; add:
'CTT'-> 'L'; add: 'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add:
'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add:
'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add:
'CGG'-> 'R'; add: 'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add:
'ACT'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add:
'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add:
'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add:
'GTG'-> 'V'; add: 'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add:
'GAT'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add:
'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> ciliateNuclearTableId [
	
	^ 6
]

{ #category : #tables }
BioDNACodonTables class >> ciliateNuclearTableNames [
	
	^ OrderedCollection 
		with: 'Ciliate Nuclear'
		with: 'Dasycladacean Nuclear'
		with: 'Hexamita Nuclear'
		with: 'SGC5'
		
]

{ #category : #tables }
BioDNACodonTables class >> ciliateNuclearTableStartCodons [
	
	^ OrderedCollection
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> ciliateNuclearTableStopCodons [
	
	^ OrderedCollection
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> echinodermMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'N'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'S'; add:
'AGG'-> 'S'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> echinodermMitochondrialTableId [
	
	^ 9
]

{ #category : #tables }
BioDNACodonTables class >> echinodermMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Echinoderm Mitochondrial'
		with: 'Flatworm Mitochondrial'
		with: 'SGC8'
]

{ #category : #tables }
BioDNACodonTables class >> echinodermMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'GTG'
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> echinodermMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> euplotidNuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add:
'AGG'-> 'R'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> euplotidNuclearTableId [
	
	^ 10
]

{ #category : #tables }
BioDNACodonTables class >> euplotidNuclearTableNames [
	
	^ OrderedCollection 
		with: 'Euplotid Nuclear'
		with: 'SGC9'
]

{ #category : #tables }
BioDNACodonTables class >> euplotidNuclearTableStartCodons [
	
	^ OrderedCollection
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> euplotidNuclearTableStopCodons [
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]

{ #category : #'initialize-release' }
BioDNACodonTables class >> initialize [
	" Private - Initialize receiver's codon tables "
	| tablesCount tableSelectors startIndex |
	
	super initialize.
	tablesCount := 17.	
	startIndex := 1.
	codonTables := OrderedCollection new: tablesCount.
	tablesCount timesRepeat: [
		tableSelectors := self tableSelectors asSortedCollection copyFrom: startIndex to: startIndex + 4.
		codonTables add: (self newCodonTable: self selectors: tableSelectors).
		startIndex := startIndex + 5 ]
]

{ #category : #tables }
BioDNACodonTables class >> invertebrateMitocondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'M'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'S'; add:
'AGG'-> 'S'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself.
]

{ #category : #tables }
BioDNACodonTables class >> invertebrateMitocondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 5
]

{ #category : #tables }
BioDNACodonTables class >> invertebrateMitocondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Invertebrate Mitochondrial'
		with: 'SGC4'
]

{ #category : #tables }
BioDNACodonTables class >> invertebrateMitocondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'TTG'
		with: 'ATT'
		with: 'ATC'
		with: 'ATA'
		with: 'ATG'
		with: 'GTG'
]

{ #category : #tables }
BioDNACodonTables class >> invertebrateMitocondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> protozoanMitocondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add: 'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add: 'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add: 'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add: 'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> protozoanMitocondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 4
]

{ #category : #tables }
BioDNACodonTables class >> protozoanMitocondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Mold Mitochondrial'
		with: 'Protozoan Mitochondrial'
		with: 'Coelenterate Mitochondrial'
		with: 'Mycoplasma'
		with: 'Spiroplasma'
		with: 'SGC3'
]

{ #category : #tables }
BioDNACodonTables class >> protozoanMitocondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection new 
			addAll: #('TTA' 'TTG' 'CTG' 'ATT' 'ATC' 'ATA' 'ATG' 'GTG');
			yourself
]

{ #category : #tables }
BioDNACodonTables class >> protozoanMitocondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> scenedesmusObliquusMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add: 'TAG'-> 'L'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add: 'CTC'-> 'L'; add:
'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add:
'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add:
'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'ATT'-> 'I'; add:
'ATC'-> 'I'; add: 'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add: 'ACC'-> 'T'; add:
'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add:
'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add:
'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add: 'GCT'-> 'A'; add:
'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add: 'GAC'-> 'D'; add:
'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add:
'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> scenedesmusObliquusMitochondrialTableId [
	
	^ 22
]

{ #category : #tables }
BioDNACodonTables class >> scenedesmusObliquusMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Scenedesmus obliquus Mitochondrial'
]

{ #category : #tables }
BioDNACodonTables class >> scenedesmusObliquusMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> scenedesmusObliquusMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'TCA'
		with: 'TAA'
		with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> standardTable [
	" Answer the NCBI standard codon table for DNA"
	
	^ Dictionary new
	add: 'TTT'-> 'F';
	add: 'TTC'-> 'F';
	add: 'TTA'-> 'L';
	add: 'TTG'-> 'L';
	add: 'TCT'-> 'S';
	add: 'TCC'-> 'S';
	add: 'TCA'-> 'S';
	add: 'TCG'-> 'S';
	add: 'TAT'-> 'Y';
	add: 'TAC'-> 'Y';
	add: 'TGT'-> 'C';
	add: 'TGC'-> 'C';
	add: 'TGG'-> 'W';
	add: 'CTT'-> 'L';
	add: 'CTC'-> 'L';
	add: 'CTA'-> 'L';
	add: 'CTG'-> 'L';
	add: 'CCT'-> 'P';
	add: 'CCC'-> 'P';
	add: 'CCA'-> 'P';
	add: 'CCG'-> 'P';
	add: 'CAT'-> 'H';
	add: 'CAC'-> 'H';
	add: 'CAA'-> 'Q';
	add: 'CAG'-> 'Q';
	add: 'CGT'-> 'R';
	add: 'CGC'-> 'R';
	add: 'CGA'-> 'R';
	add: 'CGG'-> 'R';
	add: 'ATT'-> 'I';
	add: 'ATC'-> 'I';
	add: 'ATA'-> 'I';
	add: 'ATG'-> 'M';
	add: 'ACT'-> 'T';
	add: 'ACC'-> 'T';
	add: 'ACA'-> 'T';
	add: 'ACG'-> 'T';
	add: 'AAT'-> 'N';
	add: 'AAC'-> 'N';
	add: 'AAA'-> 'K';
	add: 'AAG'-> 'K';
	add: 'AGT'-> 'S';
	add: 'AGC'-> 'S';
	add: 'AGA'-> 'R';
	add: 'AGG'-> 'R';
	add: 'GTT'-> 'V';
	add: 'GTC'-> 'V';
	add: 'GTA'-> 'V';
	add: 'GTG'-> 'V';
	add: 'GCT'-> 'A';
	add: 'GCC'-> 'A';
	add: 'GCA'-> 'A';
	add: 'GCG'-> 'A';
	add: 'GAT'-> 'D';
	add: 'GAC'-> 'D';
	add: 'GAA'-> 'E';
	add: 'GAG'-> 'E';
	add: 'GGT'-> 'G';
	add: 'GGC'-> 'G';
	add: 'GGA'-> 'G';
	add: 'GGG'-> 'G';
	yourself
]

{ #category : #tables }
BioDNACodonTables class >> standardTableId [
	" Answer the NCBI standard codon table ID for DNA"
	
	^ 1
]

{ #category : #tables }
BioDNACodonTables class >> standardTableNames [
	" Answer the NCBI standard codon table for DNA"
	
	^ OrderedCollection 
		with: 'Standard'
		with: 'SGC0'
]

{ #category : #tables }
BioDNACodonTables class >> standardTableStartCodons [
	" Answer the NCBI standard codon table start codons for DNA"
	
	^ OrderedCollection
		with: 'TTG'
		with: 'CTG'
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> standardTableStopCodons [
	" Answer the NCBI standard codon table stop codons for DNA"
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> thraustochytriumMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add: 'TCC'-> 'S'; add:
'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add: 'TGT'-> 'C'; add:
'TGC'-> 'C'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add: 'CTC'-> 'L'; add: 'CTA'-> 'L'; add:
'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add:
'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGT'-> 'R'; add:
'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'ATT'-> 'I'; add: 'ATC'-> 'I'; add:
'ATA'-> 'I'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add:
'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add:
'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GTT'-> 'V'; add:
'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add: 'GCT'-> 'A'; add: 'GCC'-> 'A'; add:
'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add:
'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> thraustochytriumMitochondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 23
]

{ #category : #tables }
BioDNACodonTables class >> thraustochytriumMitochondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Thraustochytrium Mitochondrial'
]

{ #category : #tables }
BioDNACodonTables class >> thraustochytriumMitochondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'ATT'
		with: 'ATG'
		with: 'GTG'
]

{ #category : #tables }
BioDNACodonTables class >> thraustochytriumMitochondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection
		with: 'TTA'
		with: 'TAA'
		with: 'TAG'
		with: 'TGA'
]

{ #category : #tables }
BioDNACodonTables class >> trematodeMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add:
'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add:
'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add: 'CTT'-> 'L'; add:
'CTC'-> 'L'; add: 'CTA'-> 'L'; add: 'CTG'-> 'L'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'M'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'N'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'S'; add:
'AGG'-> 'S'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add:
'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioDNACodonTables class >> trematodeMitochondrialTableId [
	
	^ 21
]

{ #category : #tables }
BioDNACodonTables class >> trematodeMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Trematode Mitochondrial'
]

{ #category : #tables }
BioDNACodonTables class >> trematodeMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'GTG'
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> trematodeMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]

{ #category : #tables }
BioDNACodonTables class >> vertebrateMitocondrialTable [
	" Answer the NCBI vertebrate mitochondrial codon table for DNA"
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
	add: 'TTT'-> 'F';
	add: 'TTC'-> 'F';
	add: 'TTA'-> 'L';
	add: 'TTG'-> 'L';
	add: 'TCT'-> 'S';
	add: 'TCC'-> 'S';
	add: 'TCA'-> 'S';
	add: 'TCG'-> 'S';
	add: 'TAT'-> 'Y';
	add: 'TAC'-> 'Y';
	add: 'TGT'-> 'C';
	add: 'TGC'-> 'C';
	add: 'TGA'-> 'W';
	add: 'TGG'-> 'W';
	add: 'CTT'-> 'L';
	add: 'CTC'-> 'L';
	add: 'CTA'-> 'L';
	add: 'CTG'-> 'L';
	add: 'CCT'-> 'P';
	add: 'CCC'-> 'P';
	add: 'CCA'-> 'P';
	add: 'CCG'-> 'P';
	add: 'CAT'-> 'H';
	add: 'CAC'-> 'H';
	add: 'CAA'-> 'Q';
	add: 'CAG'-> 'Q';
	add: 'CGT'-> 'R';
	add: 'CGC'-> 'R';
	add: 'CGA'-> 'R';
	add: 'CGG'-> 'R';
	add: 'ATT'-> 'I';
	add: 'ATC'-> 'I';
	add: 'ATA'-> 'M';
	add: 'ATG'-> 'M';
	add: 'ACT'-> 'T';
	add: 'ACC'-> 'T';
	add: 'ACA'-> 'T';
	add: 'ACG'-> 'T';
	add: 'AAT'-> 'N';
	add: 'AAC'-> 'N';
	add: 'AAA'-> 'K';
	add: 'AAG'-> 'K';
	add: 'AGT'-> 'S';
	add: 'AGC'-> 'S';
	add: 'GTT'-> 'V';
	add: 'GTC'-> 'V';
	add: 'GTA'-> 'V';
	add: 'GTG'-> 'V';
	add: 'GCT'-> 'A';
	add: 'GCC'-> 'A';
	add: 'GCA'-> 'A';
	add: 'GCG'-> 'A';
	add: 'GAT'-> 'D';
	add: 'GAC'-> 'D';
	add: 'GAA'-> 'E';
	add: 'GAG'-> 'E';
	add: 'GGT'-> 'G';
	add: 'GGC'-> 'G';
	add: 'GGA'-> 'G';
	add: 'GGG'-> 'G';
	yourself.
]

{ #category : #tables }
BioDNACodonTables class >> vertebrateMitocondrialTableId [
	" Answer the NCBI VM table ID "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ 2
]

{ #category : #tables }
BioDNACodonTables class >> vertebrateMitocondrialTableNames [
	" Answer the NCBI VM codon table names for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Vertebrate Mitochondrial'
		with: 'SGC1'
]

{ #category : #tables }
BioDNACodonTables class >> vertebrateMitocondrialTableStartCodons [
	" Answer the NCBI VM codon table start codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'ATT'
		with: 'ATC'
		with: 'ATA'
		with: 'ATG'
		with: 'GTG'
]

{ #category : #tables }
BioDNACodonTables class >> vertebrateMitocondrialTableStopCodons [
	" Answer the NCBI VM codon table stop codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
		with: 'AGA'
		with: 'AGG'
]

{ #category : #tables }
BioDNACodonTables class >> yeastMitocondrialTable [
	" Answer the NCBI yeast mitochondrial codon table for DNA"
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ self tableClass new
add: 'TTT'-> 'F'; add: 'TTC'-> 'F'; add: 'TTA'-> 'L'; add: 'TTG'-> 'L'; add: 'TCT'-> 'S'; add: 'TCC'-> 'S'; add: 'TCA'-> 'S'; add: 'TCG'-> 'S'; add: 'TAT'-> 'Y'; add: 'TAC'-> 'Y'; add: 'TGT'-> 'C'; add: 'TGC'-> 'C'; add: 'TGA'-> 'W'; add: 'TGG'-> 'W'; add: 'CTT'-> 'T'; add: 'CTC'-> 'T'; add: 'CTA'-> 'T'; add: 'CTG'-> 'T'; add: 'CCT'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAT'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGT'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'ATT'-> 'I'; add: 'ATC'-> 'I'; add: 'ATA'-> 'M'; add: 'ATG'-> 'M'; add: 'ACT'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAT'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGT'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GTT'-> 'V'; add: 'GTC'-> 'V'; add: 'GTA'-> 'V'; add: 'GTG'-> 'V'; add: 'GCT'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAT'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGT'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G';
	yourself.
]

{ #category : #tables }
BioDNACodonTables class >> yeastMitocondrialTableId [
	" Answer the NCBI yeast table ID "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ 3
]

{ #category : #tables }
BioDNACodonTables class >> yeastMitocondrialTableNames [
	" Answer the NCBI standard codon table for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Yeast Mitochondrial'
		with: 'SGC2'
]

{ #category : #tables }
BioDNACodonTables class >> yeastMitocondrialTableStartCodons [
	" Answer the NCBI yeast codon table start codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'ATA'
		with: 'ATG'
]

{ #category : #tables }
BioDNACodonTables class >> yeastMitocondrialTableStopCodons [
	" Answer the NCBI VM codon table stop codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'TAA'
		with: 'TAG'
]
