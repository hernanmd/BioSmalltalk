"
An iterator for reading SNP reports from Illumina.

BioIlluminaSNPReader readFrom: '/path/to/your/snp_report.csv'
"
Class {
	#name : #BioIlluminaSNPReader,
	#superclass : #BioObject,
	#category : #'BioNGS-Illumina'
}

{ #category : #'instance creation' }
BioIlluminaSNPReader class >> newParserFor: aFile [

	^ (NeoCSVReader on: (self openFullFileNamed: aFile) readStream)
		separator: Character tab; 
		yourself
]

{ #category : #'instance creation' }
BioIlluminaSNPReader class >> newSNPRowFrom: row [

	^ BioIlluminaSNPObject new
                name: row first;
                sampleId: row second;
                allele1Forward: row third first;
                allele2Forward: row fourth first;
                allele1Top: row fifth first;
                allele2Top: row sixth first;
                allele2AB: row seventh first;
                allele1AB: row eighth first;
                gcScore: row ninth;
                x: (row at: 10);
                y: (row at: 11);
                yourself
]

{ #category : #'instance creation' }
BioIlluminaSNPReader class >> readFrom: aFile [
	" Answer a <Collection> of SNP objects "

	| snpCollection parser |

	parser := self newParserFor: aFile.
	10 timesRepeat: [ parser skipHeader ].
	snpCollection := OrderedCollection new.
	parser rowsDo: [ : row | snpCollection add: (self newSNPRowFrom: row) ].
	^ snpCollection
]
