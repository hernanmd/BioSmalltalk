"
Wrapper for the NCBI standalone BLAST tools. These are for running BLAST locally against your own database. To use this class you must install first the command line tools for your operating system. Notice there are two versions of BLAST tools.

1) The ""historical"" BLAST, now called the ""legacy"" version
2) The ""plus"" BLAST, which is the current up to date release version.

Both have the same version numbers, so there it is a 2.2.23 version for BLAST legacy AND BLAST+. To access the legacy version, check Subclasses which wrap their specific functionality, including behavior to guess which versions are installed in the current host system. This class represents the wrapper for the latests version.

# BLAST Suite

The following programs are accessible through this wrapper

  - BLAST database integrity and validity checking application (blastdbcheck)
  - BLAST database client (blastdbcmd)
  - Stand-alone BLAST formatter client (blast_formatter)
  - Application to create BLAST database aliases (blastdb_aliastool)
  - Nucleotide-Nucleotide BLAST (blastn)
  - Protein-Protein BLAST (blastp)

# Output formats

All BLAST programs share the same codes to specify the output format. These are accessible through human-readable method names (`#formatTypeXML`, `#formatTypeTabular`, etc) or using the `#outfmt:` method with the corresponding parameter number.

     0 = Pairwise,
     1 = Query-anchored showing identities,
     2 = Query-anchored no identities,
     3 = Flat query-anchored showing identities,
     4 = Flat query-anchored no identities,
     5 = BLAST XML,
     6 = Tabular,
     7 = Tabular with comment lines,
     8 = Seqalign (Text ASN.1),
     9 = Seqalign (Binary ASN.1),
    10 = Comma-separated values,
    11 = BLAST archive (ASN.1),
    12 = Seqalign (JSON),
    13 = Multiple-file BLAST JSON,
    14 = Multiple-file BLAST XML2,
    15 = Single-file BLAST JSON,
    16 = Single-file BLAST XML2,
    18 = Organism Report

"
Class {
	#name : #BioNCBILocalBlastWrapper,
	#superclass : #BioNCBIBlastWrapper,
	#instVars : [
		'queryFastaFilename'
	],
	#category : #'BioBlast-Local'
}

{ #category : #testing }
BioNCBILocalBlastWrapper class >> isLatestVersion [

	^ true
]

{ #category : #testing }
BioNCBILocalBlastWrapper class >> isLegacyVersion [
	" Answer <true> because receiver's is the latest version "
	
	^ false
]

{ #category : #'instance creation' }
BioNCBILocalBlastWrapper class >> latest [
	"Answer a new instance of the receiver representing the latest version"
	
	^ self new
]

{ #category : #'instance creation' }
BioNCBILocalBlastWrapper class >> legacy [
	" Answer a new instance of the receiver's latest legacy version "
	
	^ ( ( self allSubclasses 
				select: [: cls | cls isLegacyVersion ] )
					detectMax: [: cls | cls versionNumber ] ) new
]

{ #category : #private }
BioNCBILocalBlastWrapper class >> programNames [
	" Answer a list of program names for resolving their path to execute them "
	
	^ #('blast_formatter.exe'      
'blastdb_aliastool.exe'    
'blastdbcheck.exe'        
'blastdbcmd.exe'           
'blastn.exe'               
'blastp.exe'               
'blastx.exe'
'convert2blastmask.exe'    
'dustmasker.exe'           
'makeblastdb.exe'          
'makembindex.exe'          
'psiblast.exe'             
'rpsblast.exe'             
'rpstblastn.exe'           
'segmasker.exe'            
'tblastn.exe'              
'tblastx.exe'        
'windowmasker.exe') 
]

{ #category : #accessing }
BioNCBILocalBlastWrapper class >> versionNumber [
	" Answer a Number of the receiver's version "

	^ 2224
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastdbaliastoolPath [
	"Answer a <String> with the full path to the Application to create BLAST database aliases binary "
	
	^  self programNamed: 'blastdb_aliastool'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastdbcheckPath [
	"Answer a <String> with the full path to the BLAST database integrity and validity checking application binary"
	
	^  self programNamed: 'blastdbcheck'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastdbcmdPath [
	"Answer a <String> with the full path to the BLAST database client binary"
	
	^  self programNamed: 'blastdbcmd'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastformatterPath [
	"Answer a <String> with the full path to the Stand-alone BLAST formatter client binary"
	
	^  self programNamed: 'blast_formatter'
]

{ #category : #accessing }
BioNCBILocalBlastWrapper >> blastn [
	"Set the receiver's program to be executed to blastn"

	self programName: self blastnPath 
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastnPath [
	"Answer a <String> with the full path to the Nucleotide-Nucleotide BLAST binary"
	
	^  self programNamed: 'blastn'
]

{ #category : #accessing }
BioNCBILocalBlastWrapper >> blastp [
	"Set the receiver's program to be executed to blastp"

	self programName: self blastpPath
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastpPath [
	"Answer a <String> with the full path to the Protein-Protein BLAST binary"
	
	^ self programNamed: 'blastp'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> blastxPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'blastx'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> convert2blastmaskPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'convert2blastmask'
]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> dbSwissProt [
	"Set the receiver's database to UniProt"

	self dbLocation
		ifNotNil: [ self database: (self dbLocation asFileReference / 'swissprot') fullName ]
		ifNil: [ self database: 'swissprot' ]

]

{ #category : #path }
BioNCBILocalBlastWrapper >> dustmaskerPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'dustmasker'
]

{ #category : #'accessing - public' }
BioNCBILocalBlastWrapper >> execute [

	| bioResult |
	bioResult := super execute.
	self queryFastaFilename asFileReference ensureDelete.
	^ bioResult.
]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> formatTypeXML [ 
	"Set the receiver's output to be XML formatted"

	self outfmt: '5'
]

{ #category : #initialization }
BioNCBILocalBlastWrapper >> initialize [

	super initialize.
	self propertySeparator: Character space.
	self useSingleDashProperties.

]

{ #category : #private }
BioNCBILocalBlastWrapper >> mainExecName [
	" Answer a String with a receiver's program name "
	
	^ 'blastn'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> makeblastdbPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'makeblastdb'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> makembindexPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'makembindex'
]

{ #category : #'accessing private' }
BioNCBILocalBlastWrapper >> outfmt: aNumber [

	self propertyAt: 'outfmt' put: aNumber
]

{ #category : #path }
BioNCBILocalBlastWrapper >> psiblastPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'psiblast'
]

{ #category : #initialization }
BioNCBILocalBlastWrapper >> query: aSequenceString [
	"Set the receiver's query sequence to aSequenceString. We create a temporary file because the command line does not seem to accept plain query strings."

	self queryFastaFilename asFileReference writeStreamDo: [ : stream |
		stream << aSequenceString ].
	self propertyAt: 'query' put: self queryFastaFilename.
]

{ #category : #accessing }
BioNCBILocalBlastWrapper >> queryFastaFilename [
	"Answer a random <String> representing a FASTA file name"

	^ queryFastaFilename
		ifNil: [ queryFastaFilename := UUIDGenerator new next asString36 , '.fna' ]
]

{ #category : #accessing }
BioNCBILocalBlastWrapper >> queryFastaFilename: anObject [

	queryFastaFilename := anObject
]

{ #category : #path }
BioNCBILocalBlastWrapper >> rpsblastPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'rpsblast'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> rpstblastnPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'rpstblastn'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> segmaskerPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'segmasker'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> tblastnPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'tblastn'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> tblastxPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'tblastx'
]

{ #category : #path }
BioNCBILocalBlastWrapper >> windowmaskerPath [
	" Answer a String with the full path to the receiver's binary "
	
	^  self programNamed: 'windowmasker'
]
