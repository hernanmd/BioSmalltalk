"
Wrapper for the NCBI standalone BLAST tools. These are for running BLAST locally against your own database. To use this class you must install first the command line tools for your operating system. Notice there are two versions of BLAST tools.

1) The ""historical"" BLAST, now called the ""legacy"" version
2) The ""plus"" BLAST, which is the current up to date release version.

Both have the same version numbers, so there it is a 2.2.23 version for BLAST legacy AND BLAST+. Subclasses wrap their specific functionality, including behavior to guess which versions are installed in the current host system.



"
Class {
	#name : #BioNCBILocalBlastWrapper,
	#superclass : #BioNCBIBlastWrapper,
	#category : #'BioBlast-Local'
}

{ #category : #testing }
BioNCBILocalBlastWrapper class >> isLatestVersion [

	^ false
]

{ #category : #'instance creation' }
BioNCBILocalBlastWrapper class >> latest [
	"Answer a new instance of the receiver representing the latest version"
	
	^ (self allSubclasses detect: [: cls | cls isLatestVersion ]) new
]

{ #category : #'instance creation' }
BioNCBILocalBlastWrapper class >> legacy [
	" Answer a new instance of the receiver's latest legacy version "
	
	^ ( ( self allSubclasses 
				select: [: cls | cls isLegacyVersion ] )
					detectMax: [: cls | cls versionNumber ] ) new
]

{ #category : #accessing }
BioNCBILocalBlastWrapper >> blastp [
	"Set the receiver's program to be executed to blastp"

	self programName: self blastpPath
]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> database: aDatabaseName [

	self propertyAt: 'db' put: aDatabaseName
]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> dbSwissProt [
	"Set the receiver's database to UniProt"

	self database: 'swissprot'
]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> formatTypeXML [ 
	"Set the receiver's database to UniProt"

	self outfmt: '5'
]

{ #category : #initialization }
BioNCBILocalBlastWrapper >> initialize [

	super initialize.
	self propertySeparator: Character space.
	self useSingleDashProperties.

]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> outfmt: aNumber [

	self propertyAt: 'outfmt' put: aNumber
]

{ #category : #initialization }
BioNCBILocalBlastWrapper >> query: aSequenceString [
	"Set the receiver's query sequence to aSequenceString"

	self propertyAt: 'query' put: aSequenceString
]
