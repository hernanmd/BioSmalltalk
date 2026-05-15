Class {
	#name : 'BioHaplotypeHapReader',
	#superclass : 'Object',
	#category : 'BioHaplotypes-Core',
	#package : 'BioHaplotypes',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioHaplotypeHapReader class >> fromFile: aFilename [

	| stream lines |
	stream := aFilename asFileReference readStream.
	[ lines := stream lines asArray ] ensure: [ stream close ].
	^ self readFromLines: lines
]

{ #category : 'instance creation' }
BioHaplotypeHapReader class >> fromString: aString [

	^ self readFromLines: aString lines asArray
]

{ #category : 'reading' }
BioHaplotypeHapReader >> readFromLines: lineArray [
	"Parse .hap format: each line is 'haplotype_name allele1 allele2 ...' 
	Returns a BioHaplotypes collection."

	| haplotypes |
	haplotypes := lineArray
		              collect: [ :line |
				              | parts alleles id |
				              parts := line findTokens: Character space.
				              parts isEmpty
					              ifTrue: [ nil ]
					              ifFalse: [
							              id := parts first.
							              alleles := parts allButFirst.
							              BioHaplotype withAlleles: alleles identifier: id ] ]
		              thenReject: [ :h | h isNil ].
	^ BioHaplotypes withHaplotypes: haplotypes identifier: 'hap_import'
]
