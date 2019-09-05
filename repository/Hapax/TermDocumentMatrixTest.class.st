Class {
	#name : #TermDocumentMatrixTest,
	#superclass : #TestCase,
	#category : 'Hapax'
}

{ #category : #private }
TermDocumentMatrixTest >> approximation [

	^#(	(	0.16	0.40	0.38	0.47	0.18	-0.05	-0.12	-0.16	-0.09 )
			(	0.14	0.37	0.33	0.40	0.16	-0.03	-0.07	-0.10	-0.04 )
			(	0.15	0.51	0.36	0.41	0.24	0.02	0.06	0.09	0.12 )
			(	0.26	0.84	0.61	0.70	0.39	0.03	0.08	0.12	0.19 )
			(	0.45	1.23	1.05	1.27	0.56	-0.07	-0.15	-0.21	-0.05 )
			(	0.16	0.58	0.38	0.42	0.28	0.06	0.13	0.19	0.22 )
			(	0.16	0.58	0.38	0.42	0.28	0.06	0.13	0.19	0.22 )
			(	0.22	0.55	0.51	0.63	0.24	-0.07	-0.14	-0.20	-0.11 )
			(	0.10	0.53	0.23	0.21	0.27	0.14	0.31	0.44	0.42 )
			(	-0.06	0.23	-0.14	-0.27	0.14	0.24	0.55	0.77	0.66 )
			(	-0.06	0.34	-0.15	-0.30	0.20	0.31	0.69	0.98	0.85 )
			(	-0.04	0.25	-0.10	-0.21	0.15	0.22	0.50	0.71	0.62 ) )
]

{ #category : #private }
TermDocumentMatrixTest >> documents [

	^#( c1 c2 c3 c4 c5 m1 m2 m3 m4 )
]

{ #category : #private }
TermDocumentMatrixTest >> matrix [

	^#(	( 1 0 0 1 0 0 0 0 0 )
			( 1 0 1 0 0 0 0 0 0 )
			( 1 1 0 0 0 0 0 0 0 )
			( 0 1 1 0 1 0 0 0 0 )
			( 0 1 1 2 0 0 0 0 0 )
			( 0 1 0 0 1 0 0 0 0 )
			( 0 1 0 0 1 0 0 0 0 )
			( 0 0 1 1 0 0 0 0 0 )
			( 0 1 0 0 0 0 0 0 1 )
			( 0 0 0 0 0 1 1 1 0 )
			( 0 0 0 0 0 0 1 1 1 )
			( 0 0 0 0 0 0 0 1 1 ) )
]

{ #category : #private }
TermDocumentMatrixTest >> nonHapaxes [

	^#('human' 'interface' 'computer' 'user' 'system' 'response' 'time' 'eps' 'survey' 'trees' 'graph' 'minors')
]

{ #category : #private }
TermDocumentMatrixTest >> singularValues [

	^#( 3.34 2.54 2.35 1.64 1.50 1.31 0.85 0.56 0.36 )
]

{ #category : #private }
TermDocumentMatrixTest >> terms [

	^#('human' 'interface' 'computer' 'user' 'system' 'response' 'time' 'eps' 'survey' 'trees' 'graph' 'minors')
]

{ #category : #running }
TermDocumentMatrixTest >> testDeer90 [

	| corpus tdm |
	corpus := CorpusTest new testDeer90.
	tdm := self testEmpty.
	tdm addVocabulary: corpus. 

	self assert: tdm documentSize = corpus documents size.
	self assert: tdm termSize = corpus terms distinctSize.

	self assert: tdm dimension = (42@9).

	^tdm
]

{ #category : #running }
TermDocumentMatrixTest >> testEmpty [

	| tdm |
	tdm := TermDocumentMatrix empty.

	self assert: tdm documentSize = 0.
	self assert: tdm termSize = 0.

	self assert: tdm dimension = (0@0).

	^tdm
]

{ #category : #running }
TermDocumentMatrixTest >> testFinalDeer90 [

	|  tdm |
	tdm := self testRemoveLegomena.
	self assert: tdm dimension = (12@9).
	
	self TODO.

	^tdm
]

{ #category : #running }
TermDocumentMatrixTest >> testRemoveLegomena [

	|  tdm expected |
	tdm := self testRemoveStopwords.
	tdm removeHapaxes.

	self assert: tdm dimension = (12@9).
	expected := 'computer eps graph human interface minors response survey system time trees user' runsSatisfying: #isLetter.
	self assert: (tdm terms asArray equalsTo: expected).

	^tdm
]

{ #category : #running }
TermDocumentMatrixTest >> testRemoveStopwords [

	|  tdm before expected |
	tdm := self testDeer90.
	before := tdm terms asArray.
	expected := 'for to in a well and of the' runsSatisfying: #isLetter.
	tdm removeEnglishStopwords.

	self assert: tdm dimension = (34@9).
	self assert: ((before \ tdm terms asArray) equalsTo: expected).

	^tdm
]

{ #category : #running }
TermDocumentMatrixTest >> testWeight [

	|  tdm |
	tdm := self testFinalDeer90.
	tdm TODO.
]
