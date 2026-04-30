Class {
	#name : 'BioQualityEncoding',
	#superclass : 'Object',
	#category : 'BioTools-Biological',
	#package : 'BioTools',
	#tag : 'Biological'
}

{ #category : 'as yet unclassified' }
BioQualityEncoding class >> illumina13 [
    "Illumina 1.3+"
    ^ 64
]

{ #category : 'as yet unclassified' }
BioQualityEncoding class >> illumina15 [
    "Illumina 1.5+"
    ^ 64
]

{ #category : 'as yet unclassified' }
BioQualityEncoding class >> illumina18 [
    "Illumina 1.8+ (same as Sanger)"
    ^ 33
]

{ #category : 'as yet unclassified' }
BioQualityEncoding class >> sanger [
    "Phred+33, Illumina 1.8+, Sanger"
    ^ 33
]

{ #category : 'as yet unclassified' }
BioQualityEncoding class >> solexa [
    "Phred+64, Illumina 1.3-1.5, Solexa/Illumina"
    ^ 64
]
