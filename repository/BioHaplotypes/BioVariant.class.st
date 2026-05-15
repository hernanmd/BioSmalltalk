"
I represent a single polymorphic site (variant/SNP) in a haplotype framework.

I hold position, referenceAllele, alternateAlleles, rsID, chromosome, name, and metadata.

Example:
| v |
v := BioVariant position: 14370 referenceAllele: 'G' alternateAlleles: #(A) rsID: 'rs12345' chromosome: '20'.
"
Class {
	#name : 'BioVariant',
	#superclass : 'Object',
	#instVars : [
		'position',
		'referenceAllele',
		'alternateAlleles',
		'rsID',
		'chromosome',
		'name',
		'metadata'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioVariant class >> position: anInteger referenceAllele: refString alternateAlleles: altArray [

	^ self new
		  position: anInteger;
		  referenceAllele: refString;
		  alternateAlleles: altArray;
		  yourself
]

{ #category : 'instance creation' }
BioVariant class >> position: anInteger referenceAllele: refString alternateAlleles: altArray chromosome: chrString [

	^ self new
		  position: anInteger;
		  referenceAllele: refString;
		  alternateAlleles: altArray;
		  chromosome: chrString;
		  yourself
]

{ #category : 'instance creation' }
BioVariant class >> position: anInteger referenceAllele: refString alternateAlleles: altArray rsID: idString [

	^ self new
		  position: anInteger;
		  referenceAllele: refString;
		  alternateAlleles: altArray;
		  rsID: idString;
		  yourself
]

{ #category : 'instance creation' }
BioVariant class >> position: anInteger referenceAllele: refString alternateAlleles: altArray rsID: idString chromosome: chrString [

	^ self new
		  position: anInteger;
		  referenceAllele: refString;
		  alternateAlleles: altArray;
		  rsID: idString;
		  chromosome: chrString;
		  yourself
]

{ #category : 'comparing' }
BioVariant >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ position = anObject position and: [
			  referenceAllele = anObject referenceAllele and: [
				  alternateAlleles = anObject alternateAlleles ] ]
]

{ #category : 'accessing' }
BioVariant >> allAlleles [

	^ { referenceAllele } , alternateAlleles
]

{ #category : 'accessing' }
BioVariant >> alternateAlleles [

	^ alternateAlleles ifNil: [ alternateAlleles := Array new ]
]

{ #category : 'accessing' }
BioVariant >> alternateAlleles: anObject [

	alternateAlleles := anObject
]

{ #category : 'accessing' }
BioVariant >> chromosome [

	^ chromosome
]

{ #category : 'accessing' }
BioVariant >> chromosome: anObject [

	chromosome := anObject
]

{ #category : 'gt-views' }
BioVariant >> gtDetailsFor: aView [

	<gtView>
	^ aView text
		  title: 'Details';
		  priority: 0;
		  text: [
				  String streamContents: [ :s |
							  s
								  nextPutAll: 'Variant: ';
								  nextPutAll: self name;
								  cr.
							  rsID ifNotNil: [
									  s
										  nextPutAll: 'rsID: ';
										  nextPutAll: rsID;
										  cr ].
							  s
								  nextPutAll: 'Chromosome: ';
								  nextPutAll: (chromosome ifNil: [ 'N/A' ]);
								  cr.
							  s
								  nextPutAll: 'Position: ';
								  nextPutAll: position printString;
								  cr.
							  s
								  nextPutAll: 'REF: ';
								  nextPutAll: referenceAllele;
								  cr.
							  s
								  nextPutAll: 'ALT: ';
								  nextPutAll: alternateAlleles asString ] ];
		  yourself
]

{ #category : 'comparing' }
BioVariant >> hash [

	^ (position hash hashMultiply bitXor: referenceAllele hash) bitXor:
		  alternateAlleles hash
]

{ #category : 'testing' }
BioVariant >> includesAllele: aString [

	^ aString = referenceAllele or: [ alternateAlleles includes: aString ]
]

{ #category : 'testing' }
BioVariant >> isBiallelic [

	^ alternateAlleles size = 1
]

{ #category : 'testing' }
BioVariant >> isIndel [

	^ self isBiallelic and: [
		  referenceAllele size > 1 or: [ (alternateAlleles at: 1) size > 1 ] ]
]

{ #category : 'testing' }
BioVariant >> isMultiAllelic [

	^ alternateAlleles size > 1
]

{ #category : 'testing' }
BioVariant >> isSNP [

	^ self isBiallelic and: [
		  referenceAllele size = 1 and: [ (alternateAlleles at: 1) size = 1 ] ]
]

{ #category : 'accessing' }
BioVariant >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'accessing' }
BioVariant >> metadataAt: aKey [

	^ self metadata at: aKey
]

{ #category : 'accessing' }
BioVariant >> metadataAt: aKey put: aValue [

	^ self metadata at: aKey put: aValue
]

{ #category : 'accessing' }
BioVariant >> name [
	"Return a human-readable name. Uses rsID if available, otherwise chromosome:position."

	^ name ifNil: [
			  rsID ifNotNil: [ rsID ] ifNil: [
					  (chromosome isNotNil and: [ position isNotNil ])
						  ifTrue: [ chromosome , ':' , position printString ]
						  ifFalse: [ 'variant' ] ] ]
]

{ #category : 'accessing' }
BioVariant >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
BioVariant >> position [

	^ position
]

{ #category : 'accessing' }
BioVariant >> position: anObject [

	position := anObject
]

{ #category : 'accessing' }
BioVariant >> referenceAllele [

	^ referenceAllele
]

{ #category : 'accessing' }
BioVariant >> referenceAllele: anObject [

	referenceAllele := anObject
]

{ #category : 'accessing' }
BioVariant >> rsID [

	^ rsID
]

{ #category : 'accessing' }
BioVariant >> rsID: anObject [

	rsID := anObject
]

{ #category : 'storing' }
BioVariant >> storeOn: aStream [

	aStream
		nextPutAll: '(';
		nextPutAll: self class name;
		nextPutAll: ' position: ';
		store: position;
		nextPutAll: ' referenceAllele: ';
		store: referenceAllele;
		nextPutAll: ' alternateAlleles: ';
		store: alternateAlleles;
		nextPutAll: ' rsID: ';
		store: rsID;
		nextPutAll: ' chromosome: ';
		store: chromosome;
		nextPutAll: ')'
]
