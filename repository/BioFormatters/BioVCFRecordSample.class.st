Class {
	#name : #BioVCFRecordSample,
	#superclass : #BioNamedObject,
	#instVars : [
		'vcfRecord',
		'genotype',
		'readDepth',
		'haplotypeQuality',
		'genotypeQuality'
	],
	#category : 'BioFormatters-Formatters-VCF'
}

{ #category : #examples }
BioVCFRecordSample class >> example01 [

	^ BioVCFRecordSample new
		name: 'NA00001';
		genotype: #(0 0);
		genotypeQuality: 48;
		readDepth: 1;
		haplotypeQuality: #(51 51);
		yourself

]

{ #category : #examples }
BioVCFRecordSample class >> example02 [
	
	^ BioVCFRecordSample new
		name: 'NA00002';
		genotype: #(1 0);
		genotypeQuality: 48;
		readDepth: 8;
		haplotypeQuality: #(51 51);
		yourself
]

{ #category : #accessing }
BioVCFRecordSample >> genotype [
	^ genotype
]

{ #category : #accessing }
BioVCFRecordSample >> genotype: anObject [
	genotype := anObject
]

{ #category : #accessing }
BioVCFRecordSample >> genotypeDelimiter [
	" Answer a <Character> "
	
	^ $|
]

{ #category : #accessing }
BioVCFRecordSample >> genotypeQuality [
	^ genotypeQuality
]

{ #category : #accessing }
BioVCFRecordSample >> genotypeQuality: anObject [
	genotypeQuality := anObject
]

{ #category : #accessing }
BioVCFRecordSample >> haplotypeQuality [
	^ haplotypeQuality
]

{ #category : #accessing }
BioVCFRecordSample >> haplotypeQuality: anObject [
	haplotypeQuality := anObject
]

{ #category : #printing }
BioVCFRecordSample >> printOn: aStream [
	" Private - See superclass implementor "
	
	aStream nextPutAll: self name
]

{ #category : #accessing }
BioVCFRecordSample >> readDepth [
	^ readDepth
]

{ #category : #accessing }
BioVCFRecordSample >> readDepth: anObject [
	readDepth := anObject
]

{ #category : #accessing }
BioVCFRecordSample >> vcfRecord [
	^ vcfRecord
]

{ #category : #accessing }
BioVCFRecordSample >> vcfRecord: anObject [
	vcfRecord := anObject
]
