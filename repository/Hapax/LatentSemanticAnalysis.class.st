Class {
	#name : #LatentSemanticAnalysis,
	#superclass : #Object,
	#instVars : [
		'tdm',
		'svd',
		'documentCorrelation',
		'termCorrelation'
	],
	#category : 'Hapax'
}

{ #category : #'instance creation' }
LatentSemanticAnalysis class >> fromFolder: filename select: aBlock [

	| corpus tdm |
	corpus := HXEnglishCorpus new.
	filename asFilename allFilesDo: [ :file |
		(aBlock value: file) ifTrue: [
			corpus addFile: file ]].
	corpus removeStopwords.
	corpus stemAll.

	tdm := TermDocumentMatrix empty.
	tdm addVocabulary: corpus.
	tdm removeHapaxes.
	tdm weight.

	^self with: tdm
]

{ #category : #'instance creation' }
LatentSemanticAnalysis class >> javaExample [

	^self 
		fromFolder: 'C:\Documents and Settings\akuhn\Desktop\workspace\MSE for Java\src' 
		select: [ :file | file tail endsWith: '.java' ]
]

{ #category : #'instance creation' }
LatentSemanticAnalysis class >> with: aTermDocumentMatrix [

	^self basicNew initialize: aTermDocumentMatrix
]

{ #category : #'accessing-queries' }
LatentSemanticAnalysis >> correlationDocument: a document: b [

	self documentCorrelation items halt
]

{ #category : #accessing }
LatentSemanticAnalysis >> documentCorrelation [

	^documentCorrelation ifNil: [ documentCorrelation := tdm documentCorrelation ]
]

{ #category : #accessing }
LatentSemanticAnalysis >> documentVectors [

	^tdm decomposition compose columns
]

{ #category : #accessing }
LatentSemanticAnalysis >> documents [

	^tdm documents
]

{ #category : #'initialize-release' }
LatentSemanticAnalysis >> initialize: aTermDocumentMatrix [

	tdm := aTermDocumentMatrix.
	svd := documentCorrelation := termCorrelation := nil.
]

{ #category : #accessing }
LatentSemanticAnalysis >> termCorrelation [

	^termCorrelation ifNil: [ tdm termCorrelation ]
]

{ #category : #accessing }
LatentSemanticAnalysis >> termVectors [

	^tdm decomposition compose rows
]

{ #category : #accessing }
LatentSemanticAnalysis >> terms [

	^tdm terms
]
