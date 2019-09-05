"
See class examples

"
Class {
	#name : #BioAffyProbeSetFormatter,
	#superclass : #Object,
	#instVars : [
		'affyReportFile',
		'families',
		'famNames',
		'famNamesAB',
		'familyDictionary',
		'csvWriter',
		'extractAX',
		'extractRS',
		'extractAlleleFrqs',
		'outputFilename',
		'extractMinAlleleFrqs',
		'fieldNrAlleleFqy',
		'fieldNrAXId',
		'fieldNrRS',
		'fieldNrGeneAnnot',
		'extractGeneAnnot'
	],
	#category : 'AffyChipBuilder'
}

{ #category : #examples }
BioAffyProbeSetFormatter class >> example1 [

	BioAffyProbeSetFormatter new
		extractGeneAnnot: true;		fieldNrGeneAnnot: 377;
		extractAX: true;				fieldNrAXId: 1;
								fieldNrRS: 365;
		extractAlleleFrqs: false;
		outputFilename: 'allele_fqs_gene-annotations.csv';
		fromFileNamed: '/usr/local/data/proyectos/microarray_igevet_2016/data/BOS1_Placas-1_4/Placas1-4_Step-1.txt'
]

{ #category : #examples }
BioAffyProbeSetFormatter class >> example2 [

	BioAffyProbeSetFormatter new
		fieldNrAlleleFqy: 384;
		fieldNrRS: 365;
		extractAX: true;
		fieldNrAXId: 1;
		extractMinAlleleFrqs: true;
		extractAlleleFrqs: false;
		outputFilename: 'allele_frequencies.csv';
		fromFileNamed: '/usr/local/data/proyectos/microarray_igevet_2016/data/BOS1_Placas-1_4/Placas1-4_Step-1.txt'
]

{ #category : #examples }
BioAffyProbeSetFormatter class >> example3 [

	BioAffyProbeSetFormatter new
		fieldNrAlleleFqy: 382;
		fieldNrRS: 365;
		extractAX: true;
		fieldNrAXId: 1;
		outputFilename: 'allele_frequencies.csv';
		fromFileNamed: '/usr/local/data/proyectos/microarray_igevet_2016/data/BOS1_Placas-1_4/Placas1-4_Step-1.txt'.
	
]

{ #category : #examples }
BioAffyProbeSetFormatter class >> example4 [

	BioAffyProbeSetFormatter new
		fieldNrAlleleFqy: 382;
		fieldNrRS: 365;
		outputFilename: 'allele_frequencies.csv';
		fromFileNamed: '/usr/local/data/proyectos/microarray_igevet_2016/data/BOS1_Placas-1_4/Placas1-4_Step-1.txt'.

	
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> csvWriter [
	^ csvWriter
		ifNil: [ 
			self initializeCSVWriter.
			csvWriter ]
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> csvWriter: anObject [
	csvWriter := anObject
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractAX [
	^ extractAX
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractAX: anObject [
	extractAX := anObject
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractAlleleFrqs [
	^ extractAlleleFrqs
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractAlleleFrqs: anObject [
	extractAlleleFrqs := anObject
]

{ #category : #report }
BioAffyProbeSetFormatter >> extractAlleleFrqsFromRecord: record position: aNumber [

	"self haltIf: [ record first = 'AX-28478436' ]."
	| alleleFrqString |
	alleleFrqString := record at: aNumber.	
	self extractAlleleFrqsFromRecordInitFamDictionary: alleleFrqString.
	self famNamesAB do: [ : famAB | 
		| alleleA alleleB |
		alleleA := self familyDictionary at: (famAB first: 3) ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a key ] ] ifAbsent: [ 'NULL' ].
		alleleB := self familyDictionary at: (famAB first: 3) ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a value ] ] ifAbsent: [ 'NULL' ] .
		self csvWriter 
			ensureOpen;
			writeField: alleleA trimBoth; 
			writeSeparator; 
			writeField: alleleB trimBoth; 
			writeSeparator;
			flush.
		].

	self familyDictionary associationsDo: [ : assoc | assoc value: nil ].
	self csvWriter writeEndOfLine 

]

{ #category : #report }
BioAffyProbeSetFormatter >> extractAlleleFrqsFromRecordInitFamDictionary: aString [ 

	(aString splitOn: ' /// ') do: [ : fqs |
		| frqs |
		frqs := fqs splitOn: ' // '.
		self families
			detect: [ : e | e = (frqs at: 3) ]
			ifFound: [ : e | self familyDictionary 
						at: e 
						put: frqs first -> frqs second ]
			ifNone: [ self halt ] ].
]

{ #category : #report }
BioAffyProbeSetFormatter >> extractFromRecord: record position: aNumber [

	(record at: aNumber) 
		ifNil: [ self csvWriter writeField: '--' ] 
		ifNotNilDo: [ : recordValue | self csvWriter writeField: recordValue trimBoth ].
	self csvWriter writeSeparator.

]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractGeneAnnot [
	^ extractGeneAnnot
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractGeneAnnot: anObject [
	extractGeneAnnot := anObject
]

{ #category : #report }
BioAffyProbeSetFormatter >> extractGeneAnnotFromRecord: aString [ 

	| annTuple emblAnn nmAnn |
	
	annTuple := OrderedCollection new: 24.
	aString notNil 
		ifTrue: [ (aString splitOn: ' /// ') do: [ : annSet | annTuple add: (annSet splitOn: ' // ') ] ].
	emblAnn := annTuple select: [ : ann | ann first beginsWith: 'ENS' ].
	nmAnn := annTuple select: [ : ann | ann first beginsWith: 'NM' ].
	[ emblAnn size = 12 ] whileFalse: [ emblAnn add:  #('---' '---' '---' '---' '---' '---' '---') ].
	[ nmAnn size = 12 ] whileFalse: [ nmAnn add:  #('---' '---' '---' '---' '---' '---' '---') ].
	^ emblAnn , nmAnn
]

{ #category : #report }
BioAffyProbeSetFormatter >> extractGeneAnnotFromRecord: record position:aNumber [

	| geneAnnotString geneAnnotTriplet |

	geneAnnotString := record at: aNumber.	
	geneAnnotTriplet := self extractGeneAnnotFromRecord: geneAnnotString.
	geneAnnotTriplet do: [ : annotSet | 
		annotSet do: [ : annotField | 
			self csvWriter 
				ensureOpen;
				writeField: annotField trimBoth; 
				writeSeparator;
				flush. ] ] .
	self csvWriter writeEndOfLine 

]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractMinAlleleFrqs [
	^ extractMinAlleleFrqs
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractMinAlleleFrqs: anObject [

	extractMinAlleleFrqs := anObject
]

{ #category : #report }
BioAffyProbeSetFormatter >> extractMinAlleleFrqsFromRecord: record position: aNumber [

	"self haltIf: [ record first = 'AX-28478436' ]."
	| alleleFrqString |
	alleleFrqString := record at: aNumber.	
	self extractMinAlleleFrqsFromRecordInitFamDictionary: alleleFrqString.
	self famNames do: [ : famName | 
		| allele |
		allele := self familyDictionary 
					at: famName  
					ifPresent: [ :a | a isNil ifTrue: [ 'NULL' ] ifFalse: [ a ] ] 
					ifAbsent: [ 'NULL' ].
		self csvWriter 
			ensureOpen;
			writeField: allele trimBoth; 
			writeSeparator;
			flush. ].

	self familyDictionary associationsDo: [ : assoc | assoc value: nil ].
	self csvWriter writeEndOfLine 

]

{ #category : #report }
BioAffyProbeSetFormatter >> extractMinAlleleFrqsFromRecordInitFamDictionary: aString [ 

	(aString splitOn: ' /// ') do: [ : fqs |
		| frqs |
		frqs := fqs splitOn: ' // '.
		self families
			detect: [ : e | e = (frqs at: 2) ]
			ifFound: [ : e | self familyDictionary 
						at: e 
						put: frqs first ]
			ifNone: [ self halt ] ].
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractRS [
	^ extractRS
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> extractRS: anObject [
	extractRS := anObject
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> famNames [
	^ famNames
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> famNames: anObject [
	famNames := anObject
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> famNamesAB [
	^ famNamesAB
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> famNamesAB: anObject [
	famNamesAB := anObject
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> families [
	^ families
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> families: anObject [
	families := anObject
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> familyDictionary [
	^ familyDictionary
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> familyDictionary: anObject [
	familyDictionary := anObject
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrAXId [
	^ fieldNrAXId
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrAXId: anObject [
	fieldNrAXId := anObject
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrAlleleFqy [
	^ fieldNrAlleleFqy
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrAlleleFqy: anObject [
	fieldNrAlleleFqy := anObject
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrGeneAnnot [
	^ fieldNrGeneAnnot
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrGeneAnnot: anObject [
	fieldNrGeneAnnot := anObject
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrRS [
	^ fieldNrRS
]

{ #category : #'accessing - fields' }
BioAffyProbeSetFormatter >> fieldNrRS: anObject [
	fieldNrRS := anObject
]

{ #category : #report }
BioAffyProbeSetFormatter >> fromFileNamed: stream [

	self 
		fromStream: stream  asFileReference readStream  



]

{ #category : #report }
BioAffyProbeSetFormatter >> fromRecord: record [

	self extractAX 
		ifTrue: [ self extractFromRecord: record position: self fieldNrAXId ].
	self extractRS 
		ifTrue: [ self extractFromRecord: record position: self fieldNrRS ].
	self extractAlleleFrqs 
		ifTrue: [ self extractAlleleFrqsFromRecord: record position: self fieldNrAlleleFqy ]
		ifFalse: [
			self extractMinAlleleFrqs ifTrue: [ 
				self extractMinAlleleFrqsFromRecord: record position: self fieldNrAlleleFqy ] ].
	self extractGeneAnnot 
		ifTrue: [ self extractGeneAnnotFromRecord: record position: self fieldNrGeneAnnot ].


]

{ #category : #report }
BioAffyProbeSetFormatter >> fromStream: stream [ 

	(NeoCSVReader on: stream)
		separator: Character tab;
		skipHeader;
		do: [ : record | self fromRecord: record ].
	self csvWriter flush

]

{ #category : #report }
BioAffyProbeSetFormatter >> geneAnnotNames [

	^ #(
	'ENS-Locus_1' 'Orientation_1' 'Pos_11' 'UniGene-Cluster_1' 'Gene_1' 'Pos_21' 'Gene-Function_1'
	'ENS-Locus_2' 'Orientation_2' 'Pos_21' 'UniGene-Cluster_2' 'Gene_2' 'Pos_22' 'Gene-Function_2'
	'ENS-Locus_3' 'Orientation_3' 'Pos_31' 'UniGene-Cluster_3' 'Gene_3' 'Pos_23' 'Gene-Function_3'
	'ENS-Locus_4' 'Orientation_4' 'Pos_41' 'UniGene-Cluster_4' 'Gene_4' 'Pos_24' 'Gene-Function_4'	
	'ENS-Locus_5' 'Orientation_5' 'Pos_51' 'UniGene-Cluster_5' 'Gene_5' 'Pos_25' 'Gene-Function_5'
	'ENS-Locus_6' 'Orientation_6' 'Pos_61' 'UniGene-Cluster_6' 'Gene_6' 'Pos_26' 'Gene-Function_6'
	'ENS-Locus_7' 'Orientation_7' 'Pos_71' 'UniGene-Cluster_7' 'Gene_7' 'Pos_27' 'Gene-Function_7'	
	'ENS-Locus_8' 'Orientation_8' 'Pos_81' 'UniGene-Cluster_8' 'Gene_8' 'Pos_28' 'Gene-Function_8'
	'ENS-Locus_9' 'Orientation_9' 'Pos_91' 'UniGene-Cluster_9' 'Gene_9' 'Pos_29' 'Gene-Function_9'
	'ENS-Locus_10' 'Orientation_10' 'Pos_101' 'UniGene-Cluster_10' 'Gene_10' 'Pos_102' 'Gene-Function_10'	
	'ENS-Locus_11' 'Orientation_11' 'Pos_111' 'UniGene-Cluster_11' 'Gene_11' 'Pos_112' 'Gene-Function_11'
	'ENS-Locus_12' 'Orientation_12' 'Pos_121' 'UniGene-Cluster_12' 'Gene_12' 'Pos_122' 'Gene-Function_12'

	'NM-Locus_1' 'Orientation_1' 'Pos_11' 'UniGene-Cluster_1' 'Gene_1' 'Pos_21' 'Gene-Function_1'
	'NM-Locus_2' 'Orientation_2' 'Pos_21' 'UniGene-Cluster_2' 'Gene_2' 'Pos_22' 'Gene-Function_2'
	'NM-Locus_3' 'Orientation_3' 'Pos_31' 'UniGene-Cluster_3' 'Gene_3' 'Pos_23' 'Gene-Function_3'
	'NM-Locus_4' 'Orientation_4' 'Pos_41' 'UniGene-Cluster_4' 'Gene_4' 'Pos_24' 'Gene-Function_4'
	'NM-Locus_5' 'Orientation_5' 'Pos_51' 'UniGene-Cluster_5' 'Gene_5' 'Pos_25' 'Gene-Function_5'
	'NM-Locus_6' 'Orientation_6' 'Pos_61' 'UniGene-Cluster_6' 'Gene_5' 'Pos_26' 'Gene-Function_6'
	'NM-Locus_7' 'Orientation_7' 'Pos_71' 'UniGene-Cluster_7' 'Gene_7' 'Pos_27' 'Gene-Function_7'	
	'NM-Locus_8' 'Orientation_8' 'Pos_81' 'UniGene-Cluster_8' 'Gene_8' 'Pos_28' 'Gene-Function_8'
	'NM-Locus_9' 'Orientation_9' 'Pos_91' 'UniGene-Cluster_9' 'Gene_9' 'Pos_29' 'Gene-Function_9'
	'NM-Locus_10' 'Orientation_10' 'Pos_101' 'UniGene-Cluster_10' 'Gene_10' 'Pos_102' 'Gene-Function_10'	
	'NM-Locus_11' 'Orientation_11' 'Pos_111' 'UniGene-Cluster_11' 'Gene_11' 'Pos_112' 'Gene-Function_11'
	'NM-Locus_12' 'Orientation_12' 'Pos_121' 'UniGene-Cluster_12' 'Gene_12' 'Pos_122' 'Gene-Function_12'	
	)
]

{ #category : #'initialize-release' }
BioAffyProbeSetFormatter >> initialize [
	" Private - Set initial values for formatting "

	super initialize.	
	self initializeFamilies.
	self extractAX: false.
	self extractRS: true.
	self extractAlleleFrqs: true.
	self extractGeneAnnot: false.
]

{ #category : #'initialize-release' }
BioAffyProbeSetFormatter >> initializeCSVWriter [

	self outputFilename asFileReference writeStreamDo: [ : writeStream | 
		| bufferedStream |

		bufferedStream := (ZnBufferedWriteStream on: writeStream) 
				yourself.
		self csvWriter: (
			(NeoCSVWriter on: bufferedStream)
				separator: Character tab;
				writeHeader: self selectedFields;					
				fieldWriter: #raw;
				yourself) ].

]

{ #category : #'initialize-release' }
BioAffyProbeSetFormatter >> initializeFamilies [

	self setFamilies.
	self familyDictionary: Dictionary new.
	self families: (self famNames do: [ : f | self familyDictionary at: f put: nil ]).

]

{ #category : #accessing }
BioAffyProbeSetFormatter >> outputFilename [
	^ outputFilename
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> outputFilename: anObject [
	outputFilename := anObject
]

{ #category : #report }
BioAffyProbeSetFormatter >> selectedFields [

	| fields |
	fields := OrderedCollection new.
	self extractRS 
		ifTrue: [ fields add: 'rs' ].
	self extractAX 
		ifTrue: [ fields add: 'AX' ].
	self extractAlleleFrqs 
		ifTrue: [ fields addAll: self famNamesAB ]
		ifFalse: [ self extractMinAlleleFrqs 
					ifTrue: [ fields addAll: self famNames ] ].
	self extractGeneAnnot 
		ifTrue: [ fields addAll: self geneAnnotNames ].
	^ fields
]

{ #category : #accessing }
BioAffyProbeSetFormatter >> setFamilies [

	famNames := ('AFR ANG AYR BDA BOR BRM BSW FLK GIR HAN HFD HOL JBL JER LMS NEL NRC RMG TUL' findTokens: ' ').
	famNamesAB := ('AFR_A AFR_B ANG_A ANG_B AYR_A AYR_B BDA_A BDA_B BOR_A BOR_B BRM_A BRM_B BSW_A BSW_B FLK_A FLK_B GIR_A GIR_B HAN_A HAN_B HFD_A HFD_B HOL_A HOL_B JBL_A JBL_B JER_A JER_B LMS_A LMS_B NEL_A NEL_B NRC_A NRC_B RMG_A RMG_B TUL_A TUL_B' findTokens: ' ').
]
