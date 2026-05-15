Class {
	#name : 'BioHaplotypeWriter',
	#superclass : 'Object',
	#instVars : [
		'haplotypes'
	],
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotypeWriter class >> on: aBioHaplotypes [

	^ self new
		  haplotypes: aBioHaplotypes;
		  yourself
]

{ #category : 'accessing' }
BioHaplotypeWriter >> haplotypes [

	^ haplotypes ifNil: [ haplotypes := BioHaplotypes new ]
]

{ #category : 'accessing' }
BioHaplotypeWriter >> haplotypes: aBioHaplotypes [

	haplotypes := aBioHaplotypes
]

{ #category : 'writing' }
BioHaplotypeWriter >> writeAsHap [
	"Write in .hap format: one line per haplotype, alleles space-separated."

	^ String streamContents: [ :s |
			  self haplotypes do: [ :h |
					  s nextPutAll: (h identifier ifNil: [ '' ]).
					  s space.
					  h alleles do: [ :a | s nextPutAll: a ] separatedBy: [ s space ].
					  s cr ] ]
]

{ #category : 'writing' }
BioHaplotypeWriter >> writeAsTabular [
	"Write haplotypes as tab-separated values."

	^ String streamContents: [ :s |
			  s nextPutAll: 'Haplotype'.
			  self haplotypes first variants do: [ :v |
					  s
						  tab;
						  nextPutAll: v name ].
			  s cr.
			  self haplotypes do: [ :h |
					  s nextPutAll: (h identifier ifNil: [ '' ]).
					  h alleles do: [ :a |
							  s
								  tab;
								  nextPutAll: a ].
					  s cr ] ]
]
