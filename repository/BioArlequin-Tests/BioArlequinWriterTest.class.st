Class {
	#name : #BioArlequinWriterTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'arFile',
		'matrix'
	],
	#category : #'BioArlequin-Tests'
}

{ #category : #accessing }
BioArlequinWriterTest >> arlequinFileClass [

	^ BioArlequinFile
]

{ #category : #testing }
BioArlequinWriterTest >> dataSample1 [

	^ 'id1 1 ACGGTGTCGA
id2 2 ACGGTGTCAG
id3 8 ACGGTGCCAA
id4 10 ACAGTGTCAA
id5 1 GCGGTGTCAA'
]

{ #category : #testing }
BioArlequinWriterTest >> dataSample2 [

	^ '[[Samples]]
	SampleName= "BOVINOS"
	SampleSize=8
	SampleData={' , self sequenceSample2 , '}'
]

{ #category : #testing }
BioArlequinWriterTest >> dataSample3 [

	^ '[[Samples]]
	SampleName= "BOVINOS"
	SampleSize=8
	SampleData={
OT1	5	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	A	C	C	A	T	T
B1	5	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
A1	6	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
CH1	3	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
J1	2	A	T	C	T	A	G	C	A	A	C	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA1	11	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
OT2	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	G	T	C	G	T	C	A	C	C	G	A	T	T
OT3	2	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
B2	1	A	T	C	T	A	G	C	A	A	T	A	C	T	A	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
A2	1	A	T	C	T	G	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
A3	1	A	T	C	T	A	G	C	A	A	T	A	C	T	A	T	T	T	T	G	T	C	T	T	C	T	A	T	C	A	T	C	A	C	C	C	A	T	T
A4	1	A	T	C	T	A	G	C	A	A	T	A	T	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA2	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA3	2	A	T	C	T	A	A	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	T	T	T
USA4	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	T	C	T	A	T	T
USA5	1	A	C	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA6	1	A	T	C	T	A	G	C	A	A	T	T	C	T	G	T	C	T	T	A	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA7	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	T	G	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
OT4	5	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
B3	2	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	C	A	T	T	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
B4	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
B5	1	A	T	C	T	A	G	T	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	G	C	C	C	A	T	T
A5	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	C	C	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
J2	1	A	T	C	T	A	A	C	A	A	C	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
J3	1	A	T	C	T	A	G	C	T	G	T	A	C	T	G	C	C	T	T	A	C	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA8	1	A	T	C	C	A	G	C	A	A	T	A	C	T	G	C	C	T	C	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA9	1	A	T	C	T	A	G	C	A	A	T	A	C	C	A	T	C	T	T	A	T	C	T	T	T	C	A	T	C	G	T	C	A	C	C	C	A	T	T
USA10	4	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	G	T	C	G	T	C	A	C	C	C	A	C	T
USA11	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	C	C	C	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA12	1	G	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	C	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA13	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	G	T	T
B6	3	A	T	T	T	A	G	T	A	A	T	A	C	C	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
C1	1	A	T	C	T	A	G	C	T	A	T	A	C	T	G	T	C	T	T	A	T	C	T	C	T	C	A	T	C	G	T	T	A	C	C	C	A	T	T
J4	1	A	T	C	T	A	A	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
USA14	2	A	C	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	T	T	C	A	T	T
OT5	4	A	T	C	T	A	G	C	G	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	A	C	C	A	C	C	T	A	T	T
OT6	3	A	T	C	T	A	G	C	G	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	A	C	C	A	C	C	C	A	T	G
B7	1	A	T	C	T	A	G	C	G	A	T	A	C	T	G	T	C	T	T	A	T	C	T	C	T	T	A	T	C	A	C	C	A	C	C	T	A	T	T
CH2	1	A	T	C	T	A	A	C	A	A	C	A	C	T	G	T	C	C	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
CH3	1	A	T	T	T	A	A	C	A	A	T	A	C	T	G	T	C	C	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
A6	1	A	T	T	T	A	G	C	A	A	T	A	C	T	C	T	C	C	T	A	T	C	T	T	T	T	A	C	C	G	T	C	A	C	C	C	A	C	T
CH4	1	A	T	T	T	A	G	C	A	A	T	A	C	T	G	T	C	C	T	A	T	C	T	C	T	T	A	T	C	G	T	C	A	C	C	T	A	C	T
A7	1	A	T	T	T	A	G	C	A	A	T	G	C	T	G	T	C	C	C	A	T	C	T	T	T	T	A	T	T	G	T	C	A	C	C	C	A	C	T
}
'
]

{ #category : #'samples-frequency' }
BioArlequinWriterTest >> frequency01Sample01 [
	" amovadis.arp "
	
	^ BioA31SampleCollection forFrequency
			identifiers: #('1' '8' '9' '13' '28' '47' '48' '49' '50' '51' '52' '53' '54');
			frequencies: #(48 2 5 23 2 2 2 1 1 1 2 1 1);
			yourself

]

{ #category : #'samples-frequency' }
BioArlequinWriterTest >> frequency01Sample02 [
	" amovadis.arp "

	^ BioA31SampleCollection forFrequency
			identifiers: #('1' '6' '8' '9' '12' '13' '27' '28' '29');
			frequencies: #(32 1 2 4 2 2 1 1 1);
			yourself

]

{ #category : #'samples-frequency' }
BioArlequinWriterTest >> frequency01Sample03 [
	" amovadis.arp "
	
	^ BioA31SampleCollection forFrequency
			identifiers: #(1 2 7 10 27 39 52 64 65 66 67 68 71);
			frequencies: #(23 39 29 2 2 5 2 2 1 1 1 2 1);
			yourself

]

{ #category : #'samples-microsat' }
BioArlequinWriterTest >> microsat01Sample01 [
	" microsat.arp "
	
	matrix := self initMatrixRows: 2 columns: 2.
	matrix 
		atColumn: 1 put: #(123 125);
		atColumn: 2 put: #(134 132).	

	^ BioA31SampleCollection forDNA
			identifiers: #(1 40);
			frequencies: #(27 1);
			matrix: matrix;
			yourself
]

{ #category : #'samples-microsat' }
BioArlequinWriterTest >> microsat01Sample02 [
	" microsat.arp "
	
	matrix := self initMatrixRows: 3 columns: 2.
	matrix 
		atColumn: 1 put: #(123 125 130);
		atColumn: 2 put: #(134 140 128).	

	^ BioA31SampleCollection forDNA
			identifiers: #(2 17 6);
			frequencies: #(37 1 21);
			matrix: matrix;
			yourself
]

{ #category : #'sections-profile' }
BioArlequinWriterTest >> profileSample1 [

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="Titulo de Prueba"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=1';
			nextPutTerminator;
			nextPutAll: '	DataType=DNA';
			nextPutTerminator;			
			nextPutAll: '	GenotypicData=1';
			nextPutTerminator;
			nextPutAll: '	LocusSeparator=WHITESPACE';
			nextPutTerminator ]

]

{ #category : #'sections-profile' }
BioArlequinWriterTest >> profileSample2 [

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="Fake HLA data"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=4';
			nextPutTerminator;
			nextPutAll: '	GenotypicData=1';
			nextPutTerminator;
			nextPutAll: '	GameticPhase=0';
			nextPutTerminator ]
]

{ #category : #'as yet unclassified' }
BioArlequinWriterTest >> profileSample3 [

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="mtDNA sequences Old Type"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=1';
			nextPutTerminator;
			nextPutAll: '	GenotypicData=0';
			nextPutTerminator ]

]

{ #category : #'as yet unclassified' }
BioArlequinWriterTest >> profileSample4 [

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: '[Profile]';
			nextPutTerminator;
			nextPutAll: '	Title="mtDNA sequences Old Type"';
			nextPutTerminator;
			nextPutAll: '	NbSamples=1';
			nextPutTerminator;
			nextPutAll: '	GenotypicData=0';
			nextPutTerminator ]

]

{ #category : #'samples-dna' }
BioArlequinWriterTest >> sequenceSample1 [

	matrix := self initMatrixRows: 2 columns: 2.
	matrix 
		atColumn: 1 put: #(A G A A G G T T);
		atColumn: 2 put: #(T C G A G A C C).
		
	^ BioA31SampleCollection forDNA
			identifiers: #(1 3 5 7);
			frequencies: #(4 5 3 8);
			matrix: matrix;
			yourself.
]

{ #category : #'samples-dna' }
BioArlequinWriterTest >> sequenceSample2 [

	^ 'OT1	5	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	A	C	C	A	T	T
B1	5	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
A1	6	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
CH1	3	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
J1	2	A	T	C	T	A	G	C	A	A	C	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA1	11	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
OT2	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	G	T	C	G	T	C	A	C	C	G	A	T	T
OT3	2	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
B2	1	A	T	C	T	A	G	C	A	A	T	A	C	T	A	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
A2	1	A	T	C	T	G	G	C	A	A	T	A	C	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
A3	1	A	T	C	T	A	G	C	A	A	T	A	C	T	A	T	T	T	T	G	T	C	T	T	C	T	A	T	C	A	T	C	A	C	C	C	A	T	T
A4	1	A	T	C	T	A	G	C	A	A	T	A	T	T	G	T	T	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA2	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA3	2	A	T	C	T	A	A	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	T	T	T
USA4	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	T	C	T	A	T	T
USA5	1	A	C	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	G	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA6	1	A	T	C	T	A	G	C	A	A	T	T	C	T	G	T	C	T	T	A	T	C	T	T	C	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA7	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	T	G	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
OT4	5	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
B3	2	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	C	A	T	T	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
B4	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
B5	1	A	T	C	T	A	G	T	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	G	C	C	C	A	T	T
A5	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	C	C	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
J2	1	A	T	C	T	A	A	C	A	A	C	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
J3	1	A	T	C	T	A	G	C	T	G	T	A	C	T	G	C	C	T	T	A	C	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA8	1	A	T	C	C	A	G	C	A	A	T	A	C	T	G	C	C	T	C	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA9	1	A	T	C	T	A	G	C	A	A	T	A	C	C	A	T	C	T	T	A	T	C	T	T	T	C	A	T	C	G	T	C	A	C	C	C	A	T	T
USA10	4	A	T	C	T	A	G	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	G	T	C	G	T	C	A	C	C	C	A	C	T
USA11	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	C	C	C	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA12	1	G	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	C	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
USA13	1	A	T	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	G	T	T
B6	3	A	T	T	T	A	G	T	A	A	T	A	C	C	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	T	T
C1	1	A	T	C	T	A	G	C	T	A	T	A	C	T	G	T	C	T	T	A	T	C	T	C	T	C	A	T	C	G	T	T	A	C	C	C	A	T	T
J4	1	A	T	C	T	A	A	C	A	A	T	A	C	T	G	C	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
USA14	2	A	C	C	T	A	G	C	A	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	T	T	C	A	T	T
OT5	4	A	T	C	T	A	G	C	G	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	A	C	C	A	C	C	T	A	T	T
OT6	3	A	T	C	T	A	G	C	G	A	T	A	C	T	G	T	C	T	T	A	T	C	T	T	T	T	A	T	C	A	C	C	A	C	C	C	A	T	G
B7	1	A	T	C	T	A	G	C	G	A	T	A	C	T	G	T	C	T	T	A	T	C	T	C	T	T	A	T	C	A	C	C	A	C	C	T	A	T	T
CH2	1	A	T	C	T	A	A	C	A	A	C	A	C	T	G	T	C	C	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
CH3	1	A	T	T	T	A	A	C	A	A	T	A	C	T	G	T	C	C	T	A	T	C	T	T	T	T	A	T	C	G	T	C	A	C	C	C	A	C	T
A6	1	A	T	T	T	A	G	C	A	A	T	A	C	T	C	T	C	C	T	A	T	C	T	T	T	T	A	C	C	G	T	C	A	C	C	C	A	C	T
CH4	1	A	T	T	T	A	G	C	A	A	T	A	C	T	G	T	C	C	T	A	T	C	T	C	T	T	A	T	C	G	T	C	A	C	C	T	A	C	T
A7	1	A	T	T	T	A	G	C	A	A	T	G	C	T	G	T	C	C	C	A	T	C	T	T	T	T	A	T	T	G	T	C	A	C	C	C	A	C	T
'
]

{ #category : #'samples-dna' }
BioArlequinWriterTest >> sequenceSample3 [
	^ BioA31SampleCollection forDNA
		identifiers:
				#('OT1' 'B1' 'A1' 'CH1' 'J1' 'USA1' 'OT2' 'OT3' 'B2' 'A2' 'A3' 'A4' 'USA2' 'USA3' 'USA4' 'USA5' 'USA6' 'USA7' 'OT4' 'B3' 'B4' 'B5' 'A5' 'J2' 'J3' 'USA8' 'USA9' 'USA10' 'USA11' 'USA12' 'USA13' 'B6' 'C1' 'J4' 'USA14' 'OT5' 'OT6' 'B7' 'CH2' 'CH3' 'A6' 'CH4' 'A7');
		frequencies: #(5 5 6 3 2 11 1 2 1 1 1 1 1 2 1 1 1 1 5 2 1 1 1 1 1 1 1 4 1 1 1 3 1 1 2 4 3 1 1 1 1 1 1);
		sequences:
				('ATCTAGCAATACTGTTTTGTCTTCTATCGTCAACCATT
ATCTAGCAATACTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAACACTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTGTTTTGTCTTCTGTCGTCACCGATT
ATCTAGCAATACTGCTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTATTTTGTCTTCTATCGTCACCCATT
ATCTGGCAATACTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTATTTTGTCTTCTATCATCACCCATT
ATCTAGCAATATTGTTTTGTCTTCTATCGTCACCCATT
ATCTAGCAATACTGTCTTGTCTTCTATCGTCACCCATT
ATCTAACAATACTGTCTTGTCTTCTATCGTCACCCTTT
ATCTAGCAATACTGTCTTGTCTTCTATCGTCATCTATT
ACCTAGCAATACTGTCTTGTCTTCTATCGTCACCCATT
ATCTAGCAATTCTGTCTTATCTTCTATCGTCACCCATT
ATCTAGCAATACTGTCTTATGTTTTATCGTCACCCATT
ATCTAGCAATACTGCCTTATCTTTTATCGTCACCCACT
ATCTAGCAATACTGTCTCATTTTTTATCGTCACCCATT
ATCTAGCAATACTGCCTTATCTTTTATCGTCACCCACT
ATCTAGTAATACTGCCTTATCTTTTATCGTCGCCCATT
ATCTAGCAATACTGCCCCATCTTTTATCGTCACCCATT
ATCTAACAACACTGCCTTATCTTTTATCGTCACCCATT
ATCTAGCTGTACTGCCTTACCTTTTATCGTCACCCATT
ATCCAGCAATACTGCCTCATCTTTTATCGTCACCCATT
ATCTAGCAATACCATCTTATCTTTCATCGTCACCCATT
ATCTAGCAATACTGCCTTATCTTTTGTCGTCACCCACT
ATCTAGCAATACTGTCTTACCCTTTATCGTCACCCATT
GTCTAGCAATACTGTCTTACCTTTTATCGTCACCCATT
ATCTAGCAATACTGTCTTATCTTTTATCGTCACCCGTT
ATTTAGTAATACCGTCTTATCTTTTATCGTCACCCATT
ATCTAGCTATACTGTCTTATCTCTCATCGTTACCCATT
ATCTAACAATACTGCCTTATCTTTTATCGTCACCCACT
ACCTAGCAATACTGTCTTATCTTTTATCGTCATTCATT
ATCTAGCGATACTGTCTTATCTTTTATCACCACCTATT
ATCTAGCGATACTGTCTTATCTTTTATCACCACCCATG
ATCTAGCGATACTGTCTTATCTCTTATCACCACCTATT
ATCTAACAACACTGTCCTATCTTTTATCGTCACCCACT
ATTTAACAATACTGTCCTATCTTTTATCGTCACCCACT
ATTTAGCAATACTCTCCTATCTTTTACCGTCACCCACT
ATTTAGCAATACTGTCCTATCTCTTATCGTCACCTACT
ATTTAGCAATGCTGTCCCATCTTTTATTGTCACCCACT' substrings: (Array with: Character cr));
		yourself
]

{ #category : #testing }
BioArlequinWriterTest >> testDataContents01 [
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Sample Title' translated;
		addSampleNumber: 1;
		addDataType: 'FREQUENCY';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	arFile newDataSection sampleSubsection
		addSampleName: 'Tharu';
		addSampleSize: '91';
		addSampleData: self frequency01Sample01;
		addSampleName: 'Oriental';
		addSampleSize: '46';
		addSampleData: self frequency01Sample02;
		addSampleName: 'Wolof';
		addSampleSize: '110';
		addSampleData: self frequency01Sample03.
	self assert: (arFile contents isKindOf: String).
	"self assert: arFile contents equals: self profileSample4."
]

{ #category : #testing }
BioArlequinWriterTest >> testDataContents02 [
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Sample Title' translated;
		addSampleNumber: 1;
		addDataType: 'DNA';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	arFile newSamplesSection
		addSampleName: '"BOVINOS"';
		addSampleSize: '8';
		addSampleData: self sequenceSample3;
		addSampleName: '"TEST2"';
		addSampleSize: '8';
		addSampleData: self sequenceSample3;
		yourself.
	self assert: (arFile contents isKindOf: String)
]

{ #category : #testing }
BioArlequinWriterTest >> testDataSection1 [
	arFile := self arlequinFileClass new.
	self assert: (arFile newDataSection isKindOf: BioA31DataSection).
	self assert: arFile contents equals: String empty
]

{ #category : #testing }
BioArlequinWriterTest >> testHaplotypeContents1 [

"	arFile := self arlequinFileClass new.
	arFile haplotypeSection
		addTitle: 'Haplotype List 1';
		addHaplotypes: self haplotypeCollection1.

	( arFile writeOn: ( out := WriteStream on: String new ) ).		
	self assert: ( out contents = self haplotypeSection1 ).
"
	
"	aSection addHaplotypes: self haplotypeCollection2.
	self assert: ( aSection contents = self haplotypeSection2 ).
	
	aSection addHaplotypes: self haplotypeCollection3.
	self assert: ( aSection contents = self haplotypeSection3 ) "
]

{ #category : #tests }
BioArlequinWriterTest >> testProfileContents1 [

	arFile := self arlequinFileClass new.
	arFile newProfileSection
		at: 'Title' put: 'mtDNA sequences Old Type';
		at: 'NbSamples' put: '1';
		at: 'GenotypicData' put: '0'.
	self assert: arFile contents equals: self profileSample3.
]

{ #category : #tests }
BioArlequinWriterTest >> testProfileContents2 [
	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'mtDNA sequences Old Type';
		addSampleNumber: '1';
		unsetGenotypicData.
	self assert: arFile contents equals: self profileSample3.
]

{ #category : #tests }
BioArlequinWriterTest >> testProfileContents3 [

	arFile := self arlequinFileClass new.
	arFile newProfileSection
		addTitle: 'Titulo de Prueba' translated;
		addSampleNumber: 1;
		addDataType: 'DNA';
		setGenotypicData;
		useLocusSeparator: 'WHITESPACE'.
	self assert: (arFile contents isKindOf: String).
	self assert: arFile contents equals: self profileSample1
]

{ #category : #tests }
BioArlequinWriterTest >> testProfileSection1 [
	
	arFile := self arlequinFileClass new.
	self assert: (arFile newProfileSection isKindOf: BioA31ProfileSection).
	self assert: arFile contents equals: String empty.	

]

{ #category : #testing }
BioArlequinWriterTest >> testProfileSection2 [
	
	arFile := self arlequinFileClass new.
	arFile newProfileSection 
			at: 'Title' put: 'Fake HLA data';
			at: 'NbSamples' put: '4';
			at: 'GenotypicData' put: '1';
			at: 'GameticPhase' put: '0'.

	self assert: arFile contents equals: self profileSample2.
	self assert: ((arFile section: 'Profile') at: 'Title') equals: 'Fake HLA data'.
	self assert: ((arFile section: 'Profile') at: 'NbSamples') equals: '4'.
	self assert: ((arFile section: 'Profile') at: 'GenotypicData') equals: '1'.
	self assert: ((arFile section: 'Profile') at: 'GameticPhase') equals: '0'.
]
