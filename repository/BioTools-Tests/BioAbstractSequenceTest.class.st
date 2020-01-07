Class {
	#name : #BioAbstractSequenceTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'sequence'
	],
	#category : #'BioTools-Tests-Biological'
}

{ #category : #accessing }
BioAbstractSequenceTest >> alphabetClass [

	^ self subclassResponsibility
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleDnaString01 [
	" Unambigous DNA String "
	
	^ 'cagtcatgctag' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleDnaString02 [
	" Unambigous DNA String "
	
	^ 'attcggaggat' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleDnaString03 [
	" Ambigous DNA String "
	
	^ 'atgStgQccR' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleDnaString04 [
	" Ambigous DNA String "
	
	^ 'TCGATCGANTGGGTC' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleProtString01 [

	^ 'FAALNFMNCSKCWKMYEDDCFLKCLEKHPYPPRWTRQWQINQQWQGNEIMSPDERVHDNW
PICYYKPEMHSRPLMGIYYNAMWPGKEIEWEHVIMYSPAP
'
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleProtString02 [
	" Ambiguous Protein String (includes X ambiguity code)"
	
	^ 'FAALNFMNCSKCWKMYEDDCFLKCLEKHPYPPRWTRQWQINQQWQGNEIMSPDEXRVHDNW
PICYYKPEMHSRPLMGIYYNAMWXPGKEIEWEHVIMYSPAP
'
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleRnaString01 [
	" Ambigous RNA String "
	
	^ 'cagucayugcuuag' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleRnaString02 [
	" Unambigous RNA String "
	
	^ 'augcggaggau' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleSeq01Complementary [

	^ 'gtcagtacgatc' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleSeq01ReverseComplementary [

	^ 'ctagcatgactg' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sampleSeq01Transcription [

	^ 'cagucaugcuag' asUppercase
]

{ #category : #accessing }
BioAbstractSequenceTest >> sequence [
	^ sequence
]

{ #category : #accessing }
BioAbstractSequenceTest >> sequence: anObject [
	sequence := anObject
]

{ #category : #accessing }
BioAbstractSequenceTest >> sequence: aString alphabet: anAlphabetClass [

	sequence := 
		BioSequence 
			newWith: aString 
			alphabet: anAlphabetClass.
]

{ #category : #accessing }
BioAbstractSequenceTest >> setUp [

	super setUp.
	sequence := BioSequence newWith: self sampleDnaString01
]
