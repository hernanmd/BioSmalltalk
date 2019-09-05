Class {
	#name : #BioRNACodonTables,
	#superclass : #BioCodonTables,
	#category : 'BioTools-Biological'
}

{ #category : #tables }
BioRNACodonTables class >> alternativeFlatwormMitochondrialId [
	
	^ 9
]

{ #category : #tables }
BioRNACodonTables class >> alternativeFlatwormMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UAA'-> 'Y'; add: 'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add:
'CUU'-> 'L'; add: 'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add:
'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add:
'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add:
'CGG'-> 'R'; add: 'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add:
'ACU'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add:
'AAC'-> 'N'; add: 'AAA'-> 'N'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add:
'AGA'-> 'S'; add: 'AGG'-> 'S'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add:
'GUG'-> 'V'; add: 'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add:
'GAU'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add:
'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> alternativeFlatwormMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Echinoderm Mitochondrial'
		with: 'Flatworm Mitochondrial'
		with: 'SGC8'
]

{ #category : #tables }
BioRNACodonTables class >> alternativeFlatwormMitochondrialTableStartCodons [
	
	^ OrderedCollection with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> alternativeFlatwormMitochondrialTableStopCodons [
	
	^ OrderedCollection with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> alternativeYeastNuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	
	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add: 'CUC'-> 'L'; add:
'CUA'-> 'L'; add: 'CUG'-> 'S'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add:
'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add:
'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'AUU'-> 'I'; add:
'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add: 'ACC'-> 'T'; add:
'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add:
'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add:
'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add: 'GCU'-> 'A'; add:
'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add: 'GAC'-> 'D'; add:
'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add:
'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> alternativeYeastNuclearTableId [
	
	^ 12
]

{ #category : #tables }
BioRNACodonTables class >> alternativeYeastNuclearTableNames [
	
	^ OrderedCollection 
		with: 'Alternative Yeast Nuclear'
]

{ #category : #tables }
BioRNACodonTables class >> alternativeYeastNuclearTableStartCodons [
	
	^ OrderedCollection
		with: 'CUG'
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> alternativeYeastNuclearTableStopCodons [
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> ascidianMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'M'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'G'; add:
'AGG'-> 'G'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> ascidianMitochondrialTableId [
	
	^ 13
]

{ #category : #tables }
BioRNACodonTables class >> ascidianMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Ascidian Mitochondrial'
]

{ #category : #tables }
BioRNACodonTables class >> ascidianMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'UUG'
		with: 'AUA'
		with: 'AUG'
		with: 'GUG'
]

{ #category : #tables }
BioRNACodonTables class >> ascidianMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> bacterialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add: 'CUC'-> 'L'; add:
'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add:
'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add:
'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'AUU'-> 'I'; add:
'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add: 'ACC'-> 'T'; add:
'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add:
'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add:
'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add: 'GCU'-> 'A'; add:
'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add: 'GAC'-> 'D'; add:
'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add:
'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> bacterialTableId [
	
	^ 11
]

{ #category : #tables }
BioRNACodonTables class >> bacterialTableNames [
	
	^ OrderedCollection 
		with: 'Bacterial and Plant Plastid'
]

{ #category : #tables }
BioRNACodonTables class >> bacterialTableStartCodons [
	
	^ OrderedCollection new 
		addAll: #('UUG' 'CUG' 'AUU' 'AUC' 'AUA' 'AUG' 'GUG');
		yourself
]

{ #category : #tables }
BioRNACodonTables class >> bacterialTableStopCodons [
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> blepharismaMacronuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UAG'-> 'Q'; add: 'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add:
'AGG'-> 'R'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> blepharismaMacronuclearTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 15
]

{ #category : #tables }
BioRNACodonTables class >> blepharismaMacronuclearTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Blepharisma Macronuclear'
]

{ #category : #tables }
BioRNACodonTables class >> blepharismaMacronuclearTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> blepharismaMacronuclearTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> chlorophyceanMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UAG'-> 'L'; add: 'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add:
'AGG'-> 'R'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> chlorophyceanMitochondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 16
]

{ #category : #tables }
BioRNACodonTables class >> chlorophyceanMitochondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Chlorophycean Mitochondrial'
]

{ #category : #tables }
BioRNACodonTables class >> chlorophyceanMitochondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> chlorophyceanMitochondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'UAA'
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> ciliateNuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UAA'-> 'Q'; add: 'UAG'-> 'Q'; add: 'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGG'-> 'W'; add:
'CUU'-> 'L'; add: 'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add:
'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add:
'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add:
'CGG'-> 'R'; add: 'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add:
'ACU'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add:
'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add:
'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add:
'GUG'-> 'V'; add: 'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add:
'GAU'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add:
'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> ciliateNuclearTableId [
	
	^ 6
]

{ #category : #tables }
BioRNACodonTables class >> ciliateNuclearTableNames [
	
	^ OrderedCollection 
		with: 'Ciliate Nuclear'
		with: 'Dasycladacean Nuclear'
		with: 'Hexamita Nuclear'
		with: 'SGC5'
		
]

{ #category : #tables }
BioRNACodonTables class >> ciliateNuclearTableStartCodons [
	
	^ OrderedCollection
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> ciliateNuclearTableStopCodons [
	
	^ OrderedCollection
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> echinodermMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	
	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'N'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'S'; add:
'AGG'-> 'S'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> echinodermMitochondrialTableId [
	
	^ 9
]

{ #category : #tables }
BioRNACodonTables class >> echinodermMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Echinoderm Mitochondrial'
		with: 'Flatworm Mitochondrial'
		with: 'SGC8'
]

{ #category : #tables }
BioRNACodonTables class >> echinodermMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'GUG'
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> echinodermMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> euplotidNuclearTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add:
'AGG'-> 'R'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> euplotidNuclearTableId [
	
	^ 10
]

{ #category : #tables }
BioRNACodonTables class >> euplotidNuclearTableNames [
	
	^ OrderedCollection 
		with: 'Euplotid Nuclear'
		with: 'SGC9'
]

{ #category : #tables }
BioRNACodonTables class >> euplotidNuclearTableStartCodons [
	
	^ OrderedCollection
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> euplotidNuclearTableStopCodons [
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]

{ #category : #'initialize-release' }
BioRNACodonTables class >> initialize [
	" Private - Initialize receiver's codon tables "
	| tablesCount tableSelectors startIndex |
	
	super initialize.
	startIndex := 1.
	tablesCount := 17.
	codonTables := OrderedCollection new: tablesCount.
	tablesCount timesRepeat: [
		tableSelectors := self tableSelectors asSortedCollection copyFrom: startIndex to: startIndex + 4.
		codonTables add: (self newCodonTable: self selectors: tableSelectors).
		startIndex := startIndex + 5 ]
]

{ #category : #tables }
BioRNACodonTables class >> invertebrateMitocondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'M'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'S'; add:
'AGG'-> 'S'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself.
]

{ #category : #tables }
BioRNACodonTables class >> invertebrateMitocondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 5
]

{ #category : #tables }
BioRNACodonTables class >> invertebrateMitocondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Invertebrate Mitochondrial'
		with: 'SGC4'
]

{ #category : #tables }
BioRNACodonTables class >> invertebrateMitocondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'UUG'
		with: 'AUU'
		with: 'AUC'
		with: 'AUA'
		with: 'AUG'
		with: 'GUG'
]

{ #category : #tables }
BioRNACodonTables class >> invertebrateMitocondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> protozoanMitocondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add: 'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add: 'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add: 'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add: 'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> protozoanMitocondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 4
]

{ #category : #tables }
BioRNACodonTables class >> protozoanMitocondrialTableNames [
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
BioRNACodonTables class >> protozoanMitocondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection new 
			addAll: #('UUA' 'UUG' 'CUG' 'AUU' 'AUC' 'AUA' 'AUG' 'GUG');
			yourself
]

{ #category : #tables }
BioRNACodonTables class >> protozoanMitocondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> scenedesmusObliquusMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	
	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add: 'UAG'-> 'L'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add: 'CUC'-> 'L'; add:
'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add:
'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add:
'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'AUU'-> 'I'; add:
'AUC'-> 'I'; add: 'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add: 'ACC'-> 'T'; add:
'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add:
'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add:
'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add: 'GCU'-> 'A'; add:
'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add: 'GAC'-> 'D'; add:
'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add:
'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> scenedesmusObliquusMitochondrialTableId [
	
	^ 22
]

{ #category : #tables }
BioRNACodonTables class >> scenedesmusObliquusMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Scenedesmus obliquus Mitochondrial'
]

{ #category : #tables }
BioRNACodonTables class >> scenedesmusObliquusMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> scenedesmusObliquusMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'UCA'
		with: 'UAA'
		with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> standardTable [
	" Answer the NCBI standard codon table for DNA"
	
	^ Dictionary new
	add: 'UUU'-> 'F';
	add: 'UUC'-> 'F';
	add: 'UUA'-> 'L';
	add: 'UUG'-> 'L';
	add: 'UCU'-> 'S';
	add: 'UCC'-> 'S';
	add: 'UCA'-> 'S';
	add: 'UCG'-> 'S';
	add: 'UAU'-> 'Y';
	add: 'UAC'-> 'Y';
	add: 'UGU'-> 'C';
	add: 'UGC'-> 'C';
	add: 'UGG'-> 'W';
	add: 'CUU'-> 'L';
	add: 'CUC'-> 'L';
	add: 'CUA'-> 'L';
	add: 'CUG'-> 'L';
	add: 'CCU'-> 'P';
	add: 'CCC'-> 'P';
	add: 'CCA'-> 'P';
	add: 'CCG'-> 'P';
	add: 'CAU'-> 'H';
	add: 'CAC'-> 'H';
	add: 'CAA'-> 'Q';
	add: 'CAG'-> 'Q';
	add: 'CGU'-> 'R';
	add: 'CGC'-> 'R';
	add: 'CGA'-> 'R';
	add: 'CGG'-> 'R';
	add: 'AUU'-> 'I';
	add: 'AUC'-> 'I';
	add: 'AUA'-> 'I';
	add: 'AUG'-> 'M';
	add: 'ACU'-> 'T';
	add: 'ACC'-> 'T';
	add: 'ACA'-> 'T';
	add: 'ACG'-> 'T';
	add: 'AAU'-> 'N';
	add: 'AAC'-> 'N';
	add: 'AAA'-> 'K';
	add: 'AAG'-> 'K';
	add: 'AGU'-> 'S';
	add: 'AGC'-> 'S';
	add: 'AGA'-> 'R';
	add: 'AGG'-> 'R';
	add: 'GUU'-> 'V';
	add: 'GUC'-> 'V';
	add: 'GUA'-> 'V';
	add: 'GUG'-> 'V';
	add: 'GCU'-> 'A';
	add: 'GCC'-> 'A';
	add: 'GCA'-> 'A';
	add: 'GCG'-> 'A';
	add: 'GAU'-> 'D';
	add: 'GAC'-> 'D';
	add: 'GAA'-> 'E';
	add: 'GAG'-> 'E';
	add: 'GGU'-> 'G';
	add: 'GGC'-> 'G';
	add: 'GGA'-> 'G';
	add: 'GGG'-> 'G';
	yourself
]

{ #category : #tables }
BioRNACodonTables class >> standardTableId [
	" Answer the NCBI standard codon table ID for DNA"
	
	^ 1
]

{ #category : #tables }
BioRNACodonTables class >> standardTableNames [
	" Answer the NCBI standard codon table for DNA"
	
	^ OrderedCollection 
		with: 'Standard'
		with: 'SGC0'
]

{ #category : #tables }
BioRNACodonTables class >> standardTableStartCodons [
	" Answer the NCBI standard codon table start codons for DNA"
	
	^ OrderedCollection
		with: 'UUG'
		with: 'CUG'
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> standardTableStopCodons [
	" Answer the NCBI standard codon table stop codons for DNA"
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> thraustochytriumMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add: 'UCC'-> 'S'; add:
'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add: 'UGU'-> 'C'; add:
'UGC'-> 'C'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add: 'CUC'-> 'L'; add: 'CUA'-> 'L'; add:
'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add:
'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGU'-> 'R'; add:
'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'AUU'-> 'I'; add: 'AUC'-> 'I'; add:
'AUA'-> 'I'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add:
'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add:
'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GUU'-> 'V'; add:
'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add: 'GCU'-> 'A'; add: 'GCC'-> 'A'; add:
'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add:
'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> thraustochytriumMitochondrialTableId [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 23
]

{ #category : #tables }
BioRNACodonTables class >> thraustochytriumMitochondrialTableNames [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Thraustochytrium Mitochondrial'
]

{ #category : #tables }
BioRNACodonTables class >> thraustochytriumMitochondrialTableStartCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'AUU'
		with: 'AUG'
		with: 'GUG'
]

{ #category : #tables }
BioRNACodonTables class >> thraustochytriumMitochondrialTableStopCodons [
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'UUA'
		with: 'UAA'
		with: 'UAG'
		with: 'UGA'
]

{ #category : #tables }
BioRNACodonTables class >> trematodeMitochondrialTable [
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add:
'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add:
'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add: 'CUU'-> 'L'; add:
'CUC'-> 'L'; add: 'CUA'-> 'L'; add: 'CUG'-> 'L'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add:
'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add:
'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add:
'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'M'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add:
'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add:
'AAA'-> 'N'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'S'; add:
'AGG'-> 'S'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add:
'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add:
'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add:
'GGA'-> 'G'; add: 'GGG'-> 'G'; yourself
]

{ #category : #tables }
BioRNACodonTables class >> trematodeMitochondrialTableId [
	
	^ 21
]

{ #category : #tables }
BioRNACodonTables class >> trematodeMitochondrialTableNames [
	
	^ OrderedCollection 
		with: 'Trematode Mitochondrial'
]

{ #category : #tables }
BioRNACodonTables class >> trematodeMitochondrialTableStartCodons [
	
	^ OrderedCollection
		with: 'GUG'
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> trematodeMitochondrialTableStopCodons [
	
	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]

{ #category : #tables }
BioRNACodonTables class >> vertebrateMitocondrialTable [
	" Answer the NCBI vertebrate mitochondrial codon table for DNA"
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
	add: 'UUU'-> 'F';
	add: 'UUC'-> 'F';
	add: 'UUA'-> 'L';
	add: 'UUG'-> 'L';
	add: 'UCU'-> 'S';
	add: 'UCC'-> 'S';
	add: 'UCA'-> 'S';
	add: 'UCG'-> 'S';
	add: 'UAU'-> 'Y';
	add: 'UAC'-> 'Y';
	add: 'UGU'-> 'C';
	add: 'UGC'-> 'C';
	add: 'UGA'-> 'W';
	add: 'UGG'-> 'W';
	add: 'CUU'-> 'L';
	add: 'CUC'-> 'L';
	add: 'CUA'-> 'L';
	add: 'CUG'-> 'L';
	add: 'CCU'-> 'P';
	add: 'CCC'-> 'P';
	add: 'CCA'-> 'P';
	add: 'CCG'-> 'P';
	add: 'CAU'-> 'H';
	add: 'CAC'-> 'H';
	add: 'CAA'-> 'Q';
	add: 'CAG'-> 'Q';
	add: 'CGU'-> 'R';
	add: 'CGC'-> 'R';
	add: 'CGA'-> 'R';
	add: 'CGG'-> 'R';
	add: 'AUU'-> 'I';
	add: 'AUC'-> 'I';
	add: 'AUA'-> 'M';
	add: 'AUG'-> 'M';
	add: 'ACU'-> 'T';
	add: 'ACC'-> 'T';
	add: 'ACA'-> 'T';
	add: 'ACG'-> 'T';
	add: 'AAU'-> 'N';
	add: 'AAC'-> 'N';
	add: 'AAA'-> 'K';
	add: 'AAG'-> 'K';
	add: 'AGU'-> 'S';
	add: 'AGC'-> 'S';
	add: 'GUU'-> 'V';
	add: 'GUC'-> 'V';
	add: 'GUA'-> 'V';
	add: 'GUG'-> 'V';
	add: 'GCU'-> 'A';
	add: 'GCC'-> 'A';
	add: 'GCA'-> 'A';
	add: 'GCG'-> 'A';
	add: 'GAU'-> 'D';
	add: 'GAC'-> 'D';
	add: 'GAA'-> 'E';
	add: 'GAG'-> 'E';
	add: 'GGU'-> 'G';
	add: 'GGC'-> 'G';
	add: 'GGA'-> 'G';
	add: 'GGG'-> 'G';
	yourself.
]

{ #category : #tables }
BioRNACodonTables class >> vertebrateMitocondrialTableId [
	" Answer the NCBI VM table ID "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 2
]

{ #category : #tables }
BioRNACodonTables class >> vertebrateMitocondrialTableNames [
	" Answer the NCBI VM codon table names for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Vertebrate Mitochondrial'
		with: 'SGC1'
]

{ #category : #tables }
BioRNACodonTables class >> vertebrateMitocondrialTableStartCodons [
	" Answer the NCBI VM codon table start codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'AUU'
		with: 'AUC'
		with: 'AUA'
		with: 'AUG'
		with: 'GUG'
]

{ #category : #tables }
BioRNACodonTables class >> vertebrateMitocondrialTableStopCodons [
	" Answer the NCBI VM codon table stop codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
		with: 'AGA'
		with: 'AGG'
]

{ #category : #tables }
BioRNACodonTables class >> yeastMitocondrialTable [
	" Answer the NCBI yeast mitochondrial codon table for DNA"
	<lint: 'Sends add:/remove: to external collection' rationale: 'No external collection' author: 'HernanMoralesDurand'>
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ self tableClass new
add: 'UUU'-> 'F'; add: 'UUC'-> 'F'; add: 'UUA'-> 'L'; add: 'UUG'-> 'L'; add: 'UCU'-> 'S'; add: 'UCC'-> 'S'; add: 'UCA'-> 'S'; add: 'UCG'-> 'S'; add: 'UAU'-> 'Y'; add: 'UAC'-> 'Y'; add: 'UGU'-> 'C'; add: 'UGC'-> 'C'; add: 'UGA'-> 'W'; add: 'UGG'-> 'W'; add: 'CUU'-> 'T'; add: 'CUC'-> 'T'; add: 'CUA'-> 'T'; add: 'CUG'-> 'T'; add: 'CCU'-> 'P'; add: 'CCC'-> 'P'; add: 'CCA'-> 'P'; add: 'CCG'-> 'P'; add: 'CAU'-> 'H'; add: 'CAC'-> 'H'; add: 'CAA'-> 'Q'; add: 'CAG'-> 'Q'; add: 'CGU'-> 'R'; add: 'CGC'-> 'R'; add: 'CGA'-> 'R'; add: 'CGG'-> 'R'; add: 'AUU'-> 'I'; add: 'AUC'-> 'I'; add: 'AUA'-> 'M'; add: 'AUG'-> 'M'; add: 'ACU'-> 'T'; add: 'ACC'-> 'T'; add: 'ACA'-> 'T'; add: 'ACG'-> 'T'; add: 'AAU'-> 'N'; add: 'AAC'-> 'N'; add: 'AAA'-> 'K'; add: 'AAG'-> 'K'; add: 'AGU'-> 'S'; add: 'AGC'-> 'S'; add: 'AGA'-> 'R'; add: 'AGG'-> 'R'; add: 'GUU'-> 'V'; add: 'GUC'-> 'V'; add: 'GUA'-> 'V'; add: 'GUG'-> 'V'; add: 'GCU'-> 'A'; add: 'GCC'-> 'A'; add: 'GCA'-> 'A'; add: 'GCG'-> 'A'; add: 'GAU'-> 'D'; add: 'GAC'-> 'D'; add: 'GAA'-> 'E'; add: 'GAG'-> 'E'; add: 'GGU'-> 'G'; add: 'GGC'-> 'G'; add: 'GGA'-> 'G'; add: 'GGG'-> 'G';
	yourself.
]

{ #category : #tables }
BioRNACodonTables class >> yeastMitocondrialTableId [
	" Answer the NCBI yeast table ID "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ 3
]

{ #category : #tables }
BioRNACodonTables class >> yeastMitocondrialTableNames [
	" Answer the NCBI standard codon table for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection 
		with: 'Yeast Mitochondrial'
		with: 'SGC2'
]

{ #category : #tables }
BioRNACodonTables class >> yeastMitocondrialTableStartCodons [
	" Answer the NCBI yeast codon table start codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>
	
	^ OrderedCollection
		with: 'AUA'
		with: 'AUG'
]

{ #category : #tables }
BioRNACodonTables class >> yeastMitocondrialTableStopCodons [
	" Answer the NCBI VM codon table stop codons for DNA"
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'HernanMoralesDurand'>

	^ OrderedCollection
		with: 'UAA'
		with: 'UAG'
]
