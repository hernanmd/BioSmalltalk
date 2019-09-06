"
BioSmalltalk is an open source library for doing bioinformatics with Smalltalk. BioSmalltalk enables you to build bioinformatics scripts and applications using the most powerful object technology as of today, the Smalltalk programming environment.


BioSmalltalk contains:
	
- Basic biological objects, like BioSequence, BioSeqRecord, BioAlignment, BioFastaRecord, BioCodonTable, etc
- BLAST objects for querying and filtering results from NCBI or locally. Tests and examples are included.
- Entrez system API with tests and examples
- Writers for formatted files as CSV, FASTA, HaploView, Fluxus Network, etc.
- Parsers for reading formatted files like XML, FASTA, NCBI identifiers or DNA sequences with degenerate bases as sent from Illumina reports, i.e. of the form : ''A[A/C]CTG'' or ''AT[A/C]TA[C/A]''.
- Tools, for creating custom views of objects using inspectors, explorers or browsers. 
"
Class {
	#name : #BaselineOfBioSmalltalk,
	#superclass : #BaselineOf,
	#instVars : [
		'fileRef'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'BaselineOfBioSmalltalk'
}

{ #category : #baselines }
BaselineOfBioSmalltalk >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec repository: 'github://hernanmd/BioSmalltalk/repository/'.
		
		spec 
			baseline: 'CommonUtils'			with: [ spec repository: 'github://hernanmd/CommonUtils/repository' ];
			baseline: 'ProjectFramework' 	with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ];			
			baseline: 'CodeGenerator' 		with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];
			baseline: 'StringExtensions' 	with: [ spec repository: 'github://hernanmd/StringExtensions/repository' ];
			baseline: 'PolyMath'	 			with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ].
				
		self projectSpecForINIParser: spec.
		self projectSpecForPetitParser: spec.				
		self projectSpecForRoassal: spec.
		self projectSpecsForXML: spec.
				
		self baselineOSDeps: spec.
		self baselinePackages: spec.
		self baselineGroups: spec ]

]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineAllGroup: spec [

	spec
		group: 'Basic'
		with: #(
			'Core' 
			'Tests'
			'PopulationGenomics'
			'Projects')
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineBasicGroup: spec [

	spec
		group: 'Basic'
		with: #(
			'BioTools' 
			'BioNCBI'
			'BioBlast'
			'BioParsers'
			'BioFormatters'
			'BioPharo7')
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineCoreGroup: spec [

	spec 
		group: 'Core' 
		with: #(
			'BioTools' 
			'BioNCBI' 
			'BioWrappers' 
			'BioEntrez' 
			'BioBlast' 
			'BioParsers' 
			'BioFormatters' 
			'BioClassifier' 
			'BioEBI' 
			'BioToolsSamples' 
			'BioBlastSamples' 
			'BioHaplotypes' 
			'BioBenchmarks' 
			'BioIllumina' 
			'BioPharo4'
			'BioNGS' )
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineGroups: spec [

	self baselineCoreGroup: spec.
	self baselineBasicGroup: spec.
	self baselinePopGenGroup: spec.
	self baselineProjectsGroup: spec.
	self baselineTestsGroup: spec.
	self baselineAllGroup: spec.
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineOSDeps: spec [

	spec
		for: #(Unix MacOS)
		do: [
			self osSubprocess: spec.
			spec package: 'BioWrappers' with: [ spec requires: #('OSSubprocess') ] ].

	spec
		for: #Windows
		do: [ 
			self processWrapper: spec.
			spec package: 'BioWrappers' with: [ spec requires: #('ProcessWrapper') ] ].
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselinePackages: spec [

		spec 
			package: 'BioAffymetrix' 			with: [ spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' 				with: [ spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioBlast' 					with: [ spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' 			with: [ spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' 			with: [ spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' 		with: [ spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' 						with: [ spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' 					with: [ spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' 			with: [ spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' 		with: [ spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' 			with: [ spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioIllumina' 				with: [ spec requires: #('BioTools' ). ];
			package: 'BioLAMPLD' 					with: [ spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' 					with: [ spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' 				with: [ spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioNGS' 						with: [ spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioParserTests' 			with: [ spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' 				with: [ spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioPharo4' 					with: [ spec requires: #('BioTools' ). ];
			package: 'BioPharo7' 					with: [ spec requires: #('BioTools' ). ];								
			package: 'BioPopulation' 			with: [ spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' 				with: [ spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' 			with: [ spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' 		with: [ spec requires: #('BioTools' ). ];
			package: 'BioSupport' 				with: [ spec requires: #('BioTools' ). ];
			package: 'BioTools' 					with: [ spec requires: #('CommonUtils' 'StringExtensions' 'PetitParser' 'PolyMath' 'XMLParser'). ];
			package: 'BioToolsSamples' 			with: [ spec requires: #('BioTools' 'BioEntrez' 'BioParsers' ). ];
			package: 'BioToolsTests' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' 			with: [ spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' 				with: [ spec requires: #('BioTools' ) ];
			package: 'BioPlots'					with: [ spec requires: #('BioTools' 'Roassal2') ].
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselinePopGenGroup: spec [

	spec
		group: 'PopulationGenomics'
		with: #(
			'BioTools'
			'BioPopulation'
			'BioHaplotypes' 
			'BioLAMPLD')
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineProjectsGroup: spec [

	spec
		group: 'Projects'
		with: #('BioProject' 'BioSoftwareCatalog')
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineTestsGroup: spec [

	spec			
		group: 'Tests' 
		with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' )
]

{ #category : #accessing }
BaselineOfBioSmalltalk >> customProjectAttributes [
	Smalltalk os isMacOS ifTrue: [ ^ #(#MacOS) ].
	Smalltalk os isUnix ifTrue: [ ^ #(#Unix) ].
	Smalltalk os isWindows ifTrue: [ ^ #(#Windows) ]
]

{ #category : #doits }
BaselineOfBioSmalltalk >> ensureMetacelloFileDownload [

	Metacello new           
		baseline: 'MetacelloFileDownload';              
		repository: 'github://hernanmd/MetacelloFileDownload';          
		load.
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> osSubprocess: spec [
	spec 
		configuration: 'OSSubprocess' 
		with: [ 
			spec
				versionString: #stable;
				repository: 'github://marianopeck/OSSubprocess/repository' ]

]

{ #category : #doits }
BaselineOfBioSmalltalk >> platformFilesUrl [
	" Answer a <Collection> of download URLs for the current platform "

	^ Smalltalk os isWin32 
		ifTrue: [ #('https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.zip') ]
		ifFalse: [ #('https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.tar.gz') ].

]

{ #category : #doits }
BaselineOfBioSmalltalk >> preLoad [

    self ensureMetacelloFileDownload.
    super preLoad.
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> processWrapper: spec [
	spec 
		configuration: 'ProcessWrapper' 
		with: [ 
			spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ]
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> projectSpecForINIParser: spec [

	spec
			project: 'INIFileSupport' 
			with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: '0.1-baseline';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ].
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> projectSpecForPetitParser: spec [

	spec
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '2.0';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> projectSpecForRoassal: spec [

	spec
		project: 'Roassal2' 
		with: [
			spec
				className: #ConfigurationOfRoassal2;
				versionString: #'stable';
				loads: #('NoGlamour' );
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> projectSpecsForXML: spec [

	spec
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: '2.5.2';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];

			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
	
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].
]
