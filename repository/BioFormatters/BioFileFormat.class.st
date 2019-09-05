"
Holds a registry of Bioinformatics File Formats.

The method #formatCollection answer a <Collection> of recognized file formats. 

If you add, edit or remove an element from the format collection, you must re-initialize the format collection to get updated.

BioFileFormat initialize.

References:

http://www.molecularevolution.org/resources/fileformats/converting
http://en.wikipedia.org/wiki/List_of_phylogenetics_software
http://assets.geneious.com/manual/8.0/GeneiousManualse15.html



"
Class {
	#name : #BioFileFormat,
	#superclass : #BioNamedObject,
	#instVars : [
		'description',
		'extensions',
		'rootClass',
		'compatibleFormats',
		'sampleEntry'
	],
	#classVars : [
		'Registry'
	],
	#category : #'BioFormatters-Files'
}

{ #category : #accessing }
BioFileFormat class >> fileExtensionFor: aFormatString [
	" Answer a String corresponding aFormatString in the receiver's registry "
	
	" Get updated "
	self initialize.
	^ (self fileExtensionsFor: aFormatString) anyOne
]

{ #category : #accessing }
BioFileFormat class >> fileExtensionsFor: aFormatString [

	| fmt |
	
	fmt := [ self formatFor: aFormatString ]
	on: BioNotFoundObject
	do: [: ex | ^ ex signal ].
	^ fmt extensions
]

{ #category : #accessing }
BioFileFormat class >> formatFor: aString [
	" Answer a <BioFileFormat> in the receiver's registry matching aString. Signal an exception if not found "

	| found |
	found  := self registry 
				detect: [: fmt | (fmt includesExtension: aString) or: [ fmt includesName: aString ]]
				ifNone: [ self signalNotFound: aString ].
	^ found
	

			
]

{ #category : #'initialize-release' }
BioFileFormat class >> formatsCollection [
	" Answer a Collection with information about well-known file formats.  See http://www.bioperl.org/wiki/HOWTO:SeqIO for details
	BioFileFormat formatCollection "
	
	" 
	1) <String> File format name
	2) <Collection> File format extensions
	3) <String> File format description
	4) <Collection> Software names that inputs this file type
	5) <Collection> Software names that outputs this file type "

	^ #( 
			#(
			'ABI tracefile' 								
			#('abi' 'ab1') 						
			'This is the standard chromatogram format from ABI' 
			#()
			#()
			)
			
		#(
			'Ace database' 
			#('ace')
			'The ACE sequence format, used by AceDB'
			#()
			#()
		)
		
		#(
			'AGAVE XML'
			#()
			'AGAVE - Architecture for Genomic Annotation, Visualization and Exchange - is an XML format developed by "DoubleTwist" (now defunct) for managing, visualizing and sharing annotations of genomic sequences.'
			#()	
			#()
		)
		
		#(
			'ALF tracefile'
			#('alf')
			'A sequence trace format for encoding chromatograms'
			#()
			#()
		)
		
		#(
			'Arlequin Project'
			#('arp')
			'Arlequin Project File'
			#()
			#()
		)
		
		#(
			'BED'
			#('bed')
			'BED Annotations'
			#('USCS')
			#('USCS')
		)
		
		#(
			'BlastReportCSV'
			#('csv')
			'Blast Report in CSV'
			#()
			#('BioSmalltalk')
		)
		
		#(
			'BSML'
			#('bsml')
			'Bioinformatic Sequence Markup Language - is an open XML format for exchanging sequences and their meta-data.'
			#()
			#()
		)
		
		#(
			'CHADO sequence format'
			#()
			'An XML interchange format based on the Chado relational database.'
			#()	
			#()
		)
					
		#(
			'CHAOS sequence format'
			#()
			'The CHAOS format was derived from the CHADO sequence format'	
			#()
			#()
		)
		
		#(
			'Chaos XML'
			#()
			'Chaos-XML is based on the Chado relational model and is a subset of Chado''s content'
			#()
			#()
		)
	
		#(
			'Clustal'
			#('aln')
			'Alignments'
			#('ClustalW' 'ClustalX')
			#('ClustalW' 'ClustalX')
		)
		
		#(
			'CSFASTA'
			#('csfasta')
			'Color space FASTA'
			#('ABI SOLiD')
			#('ABI SOLiD')
		)
		
		#(
			'CSV'
			#('csv')
			'Generic CSV format'
			#()
			#()
		)
		
		#(
			'CTF tracefile'
			#('ctf')
			'A chromatogram format'
			#()
			#()
		)
		
		#(
			'DNAStar'
			#('seq' 'pro')
			'Nucleotide & protein sequences'
			#('DNAStar')
			#('DNAStar')
		)
		
		#(
			'EMBL database'
			#('ebl' 'emb' 'dat')
			'The EMBL flat format is a rich format for storing sequences and their associated meta-information, feature coordinates, and annotations. It shares details with the GenBank sequence format'
			#()
			#()
		)
		
		#(
			'Entrez Gene'
			#('asn1')
			'Entrez Gene ASN1 format'
			#()
			#()
		)
		
		#(
			'Excel'
			#('xls' 'xlsx')
			'A semi-structured spreadsheet format using Microsoft Excel. See also Table.'
			#()
			#()
		)
		
		#(
			'Staden EXP format'
			#('exp ')
			'The exp sequence format stores a quality score for each base or nucleotide.'
			#()
			#()
		)
		
		#(
			'FASTA'
			#('fast' 'seq' 'fa' 'fsa' 'nt' 'aa')
			'One of the oldest and simplest sequence formats.'
			#('ClustalW' 'ClustalX' 'MAFFT')
			#('ClustalW' 'ClustalX' 'MAFFT')
		)
		
		#(
			'FASTAQ quality score data in FASTA-like format'
			#('fastq')
			''
			#()
			#()
		)

		#(
			'GAME XML'
			#()
			'The GAME format is a rich XML format for storing sequences and their associated annotations'
			#()
			#()
		)
		
		#(
			'GBSeqCSV'
			#('csv')
			'GBSeq from XML exported as CSV'
			#()
			#()
		)
		
		#(
			'GCG'
			#('gcg') 	
			'Accelrys GCG Wisconsin package'
			#()
			#()
		)
		
		#(
			'GenBank'
			#('gbank' 'genbank' 'gbff' 'gb' 'gbk')
			'GenBank plain text format'
			#()
			#()
		)
		
		#('Google Fusion Tables'
			#('csv')
			'Google Fusion Tables exported as CSV'
			#()
			#()
		)
		
		#(
			'InterProScan XML'
			#()
			''
			#()
			#()
		)				
	
		#(
			'KEGG'
			#()
			'KEGG: Kyoto Encyclopedia of Genes and Genomes'
			#()
			#()
		)
		
		#(
			'Large files, fasta format'
			#()
			''
			#()
			#()
		)
		
		#(
			'Lasergene format' 							#() 								'' 													#()						#())
		#(
			'LocusLink LL_tmpl' 							#() 								'' 													#()						#())
		#(
			'MEGA6'
			#('meg')
			'MEGA6: Molecular Evolutionary Genetics Analysis version 6.0'
			#('MEGA' 'MEGA6' 'Clustal' 'PAUP' 'MacClade' 'PHYLIP' 'FASTA' 'GCG' 'PIR' 'NBRF' 'IG' 'XML')
			#('')
		)
		
		#(
			'metafasta' 									#() 								'' 													#()						#())
																																							
		#(
			'Newick'
			#('new')
			'Newick tree file format'
			#()
			#()
		)
		
		#(
			'Nexus'
			#('nex' 'nxs')
			'Can store DNA and protein sequences, taxa distances, alignment scores, and phylogenetic trees.'
			#('BEAUti' 'GARLI' 'Modeltest' 'MrBayes' 'PAUP' 'MacClade' 'Mesquite')
			#('ClustalW' 'ClustalX' 'PAUP')
		)
		
		#(
			'Phred'
			#('phred')
			'The phd format is created by PHRED to store serialized chromatogram data.'
			#()
			#()
		)
		
		#(
			'Phylip'
			#('phy' 'ph')
			'PHYLIP is a free computational phylogenetics package of programs for inferring evolutionary trees (phylogenies)'
			#('GARLI' 'LAMARC' 'Migrate-n' 'PAML' 'PHYLIP')
			#('ClustalW' 'ClustalX' 'PAUP' 'PHYLIP')
		)
	
		#(
			'PIR'
			#('pir')
			''
			#('ClustalW' 'ClustalX')
			#('ClustalW' 'ClustalX')
		)
		
	#('PLN tracefile' 								#('pln') 							'' 													#()						#())
	#('PTT' 										#('ptt') 							'PTT file format is a table of protein features' 				#()						#())
	#('plain text' 									#('txt') 							'' 													#()						#())
	#('RNA translation tables' 						#('rnt') 							'' 													#()						#())
	#('Standard Chromatogram Format' 				#('scf') 							'Standard Chromatogram Format, a binary chromatogram format' #()						#())
	#('SeqXML sequence format' 						#('xml') 							'The SeqXML schema (XSD) defines the skeletal structure of the sequence files and allows one to set constraints for each type of data it contains: for example, one can limit a DNA sequence to consist only of {A,G,C,T,N}. If one then tries to import a DNA sequence containing a 'Z', this error will be detected automatically by any XML validator. As with FASTA, a SeqXML file includes the gene or protein ID, a description and the sequence itself, but it also provides the option to add alternative identifiers. The content can be validated and the position is well defined making it easy to parse and process.' #()						#())		
	#('DNA Strider format' 							#('str' 'xdna' 'xdgn')					''						#('DNA Strider' 'SnapGene' 'ApE') 		#('DNA Strider'))
	#('SwissProt' 									#('sp') 							''						#()								#())
	#('tab-delimited' 								#() 								'' 						#()								#())
	#('Table' 										#() 								'A semi-structured format where values are organized by column. See also Excel. ' #()						#())		
	#('TIGR XML' 									#('xml') 							'' 						#()						#())
	#('TIGR Coordset XML' 							#('xml') 							'' 						#()						#())
	#('NCBI TinySeq XML' 							#('xml') 							'' 						#()						#())
	#('ZTR tracefile' 								#('ztr') 							'A compact sequence trace format for encoding chromatograms' #()						#()) 
)

]

{ #category : #'initialize-release' }
BioFileFormat class >> initialize [
	" Private - Initialize receiver's file formats. 
	self initialize "
	
	self registry: nil.
	self formatsCollection
		do: [: formatSpec |
				self 
					registerFormat: formatSpec first 
					extensions: formatSpec second
					description: formatSpec third
					rootClass: formatSpec fourth ]
]

{ #category : #testing }
BioFileFormat class >> isRegistered: aString [
	" Search aString in the receiver's registered names and descriptions. Answer <true> if found "
	
	^ (self registry 
		detect: [: fmt | (fmt includesExtension: aString) or: [ fmt includesName: aString ] ]
		ifNone: [ nil ]) notNil
]

{ #category : #accessing }
BioFileFormat class >> registerFormat: nameString extensions: aCollection description: descriptionString rootClass: aClass [
	" Create a new format and register in the receiver if not present "
	
	| newFormat |
	newFormat := self new 
			extensions: aCollection;
			description: descriptionString;
			name: nameString;
			rootClass: aClass.
	(self registry includes: newFormat)
		ifFalse: [ self registry add: newFormat ]

			
]

{ #category : #accessing }
BioFileFormat class >> registry [
	" Answer a <Collection> of <BioFileFormat> "
	
	^ Registry
		ifNil: [ Registry := OrderedCollection new ]
]

{ #category : #accessing }
BioFileFormat class >> registry: aCollectionOfBioFileFormat [
	" Set the receiver's registry of file formats to aCollection of <BioFileFormat> "
	
	Registry := aCollectionOfBioFileFormat
]

{ #category : #accessing }
BioFileFormat class >> removeFormat: nameString [
	" Remove the format nameString if found from the receiver's registry "

	(self formatFor: nameString)
		ifNotNil: [ :fmt | 
			self registry
				remove: fmt
				ifAbsent: [ self signalNotFound: nameString ] ]
]

{ #category : #accessing }
BioFileFormat >> compatibleFormats [
	^ compatibleFormats
]

{ #category : #accessing }
BioFileFormat >> compatibleFormats: anObject [
	compatibleFormats := anObject
]

{ #category : #accessing }
BioFileFormat >> description [
	^ description
]

{ #category : #accessing }
BioFileFormat >> description: anObject [
	description := anObject
]

{ #category : #accessing }
BioFileFormat >> extensions [
	^ extensions
]

{ #category : #accessing }
BioFileFormat >> extensions: anObject [
	extensions := anObject
]

{ #category : #testing }
BioFileFormat >> includesExtension: aString [
	" Answer <true> if receiver is represented as file with extension aString "

	^ (self extensions collect: #asLowercase) includes: aString asLowercase
]

{ #category : #accessing }
BioFileFormat >> includesName: aString [
	" Answer <true> if receiver contains aString in any of its names "

	(self names anySatisfy: [: fmtName | fmtName asLowercase = aString asLowercase ])
		ifTrue: [ ^ true ].
	((self names collect: #asLowercase) anySatisfy: [: fmtName | (fmtName findTokens: ' ') includes: aString asLowercase ])
		ifTrue: [ ^ true ].
	(((self description collect: #asLowercase) findTokens: ' ') includes: aString asLowercase)
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #printing }
BioFileFormat >> printOn: aStream [
	" See superimplementor's comment "
	
	aStream
		nextPutAll: self name;
		space;
		nextPut: $(.
	self extensions do: [: ext |
		aStream 
			nextPut: $.;
			nextPutAll: ext;
			space ].
	aStream
		nextPut: $)

		
]

{ #category : #accessing }
BioFileFormat >> rootClass [
	^ rootClass
]

{ #category : #accessing }
BioFileFormat >> rootClass: anObject [
	rootClass := anObject
]

{ #category : #accessing }
BioFileFormat >> sampleEntry [
	^ sampleEntry
]

{ #category : #accessing }
BioFileFormat >> sampleEntry: anObject [
	sampleEntry := anObject
]
