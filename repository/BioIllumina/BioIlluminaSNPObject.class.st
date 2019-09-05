"
BioIlluminaSNPObject represents a row in an Illumina SNP report

Instance Variables:
	sampleId	<ProtoObject>
	allele1Forward	<ProtoObject>
	allele2Forward	<ProtoObject>
	allele1Top	<ProtoObject>
	allele2Top	<ProtoObject>
	allele1AB	<ProtoObject>
	allele2AB	<ProtoObject>
	gcScore	<Float>
	x	<Float>
	y	<Float>
"
Class {
	#name : #BioIlluminaSNPObject,
	#superclass : #BioNamedObject,
	#instVars : [
		'sampleId',
		'allele1Forward',
		'allele2Forward',
		'allele1Top',
		'allele2Top',
		'allele1AB',
		'allele2AB',
		'gcScore',
		'x',
		'y'
	],
	#category : 'BioIllumina-Core'
}

{ #category : #accessing }
BioIlluminaSNPObject >> allele1AB [
	^ allele1AB
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele1AB: anObject [
	allele1AB := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele1Forward [
	^ allele1Forward
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele1Forward: anObject [
	allele1Forward := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele1Top [
	^ allele1Top
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele1Top: anObject [
	allele1Top := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele2AB [
	^ allele2AB
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele2AB: anObject [
	allele2AB := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele2Forward [
	^ allele2Forward
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele2Forward: anObject [
	allele2Forward := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele2Top [
	^ allele2Top
]

{ #category : #accessing }
BioIlluminaSNPObject >> allele2Top: anObject [
	allele2Top := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> gcScore [
	^ gcScore
]

{ #category : #accessing }
BioIlluminaSNPObject >> gcScore: anObject [
	gcScore := Float readFrom: anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> sampleId [
	^ sampleId
]

{ #category : #accessing }
BioIlluminaSNPObject >> sampleId: anObject [
	sampleId := anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> x [
	^ x
]

{ #category : #accessing }
BioIlluminaSNPObject >> x: anObject [
	x := Float readFrom: anObject
]

{ #category : #accessing }
BioIlluminaSNPObject >> y [
	^ y
]

{ #category : #accessing }
BioIlluminaSNPObject >> y: anObject [
	y := Float readFrom: anObject
]
