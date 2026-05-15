Class {
	#name : 'BioPhasedGenotype',
	#superclass : 'Object',
	#instVars : [
		'haplotype1',
		'haplotype2',
		'identifier',
		'metadata'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioPhasedGenotype class >> withHaplotype1: h1 haplotype2: h2 [

	^ self new
		  haplotype1: h1;
		  haplotype2: h2;
		  yourself
]

{ #category : 'accessing' }
BioPhasedGenotype >> genotypeAt: anIndex [

	^ Array with: (haplotype1 at: anIndex) with: (haplotype2 at: anIndex)
]

{ #category : 'accessing' }
BioPhasedGenotype >> genotypeAtRsID: aString [

	| idx |
	idx := haplotype1 variants findFirst: [ :v | v rsID = aString ].
	idx = 0 ifTrue: [
		self error: 'No variant with rsID ' , aString , ' found' ].
	^ self genotypeAt: idx
]

{ #category : 'accessing' }
BioPhasedGenotype >> genotypeString [

	^ String streamContents: [ :s |
			  1 to: haplotype1 size do: [ :i |
					  s nextPutAll: (haplotype1 at: i).
					  s nextPut: $/.
					  s nextPutAll: (haplotype2 at: i).
					  i < haplotype1 size ifTrue: [ s space ] ] ]
]

{ #category : 'accessing' }
BioPhasedGenotype >> haplotype1 [

	^ haplotype1
]

{ #category : 'accessing' }
BioPhasedGenotype >> haplotype1: aHaplotype [

	haplotype1 := aHaplotype
]

{ #category : 'accessing' }
BioPhasedGenotype >> haplotype2 [

	^ haplotype2
]

{ #category : 'accessing' }
BioPhasedGenotype >> haplotype2: aHaplotype [

	haplotype2 := aHaplotype
]

{ #category : 'accessing' }
BioPhasedGenotype >> identifier [

	^ identifier
]

{ #category : 'accessing' }
BioPhasedGenotype >> identifier: aString [

	identifier := aString
]

{ #category : 'testing' }
BioPhasedGenotype >> isHeterozygousAt: anIndex [

	^ (haplotype1 at: anIndex) ~= (haplotype2 at: anIndex)
]

{ #category : 'testing' }
BioPhasedGenotype >> isHomozygousAt: anIndex [

	^ (haplotype1 at: anIndex) = (haplotype2 at: anIndex)
]

{ #category : 'accessing' }
BioPhasedGenotype >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'printing' }
BioPhasedGenotype >> printOn: aStream [

	aStream nextPutAll: self class name.
	aStream nextPutAll: '('.
	haplotype1 ifNotNil: [ :h | aStream nextPutAll: h asAlleleString ].
	aStream nextPutAll: ' | '.
	haplotype2 ifNotNil: [ :h | aStream nextPutAll: h asAlleleString ].
	aStream nextPutAll: ')'
]
