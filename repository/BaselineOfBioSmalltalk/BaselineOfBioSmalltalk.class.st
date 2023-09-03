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
	#category : #BaselineOfBioSmalltalk
}

{ #category : #baselines }
BaselineOfBioSmalltalk >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'. 
		
		spec preLoadDoIt: #preLoad.
		spec postLoadDoIt: #'postLoad'.
		spec repository: 'github://hernanmd/BioSmalltalk/repository/'.
		
		self 
			projectSpecForCommonUtils: spec;
			projectSpecForDataDrameInspector: spec;
			projectSpecForProjectFramework: spec;
			projectSpecForStringExtensions: spec;
			projectSpecForFileDialog: spec;
			projectSpecForPolyMath: spec;
			projectSpecForINIParser: spec;
			projectSpecForPetitParser: spec;
			projectSpecForRoassal2: spec.

		self baselineOSDeps: spec.
		self baselinePackages: spec.
		self baselineGroups: spec ].

	self baselinePharo: spec.

]

{ #category : #groups }
BaselineOfBioSmalltalk >> baselineAllGroup: spec [

	spec
		group: 'All'
		with: #(
			'Core' 
			'Tests'
			'PopulationGenomics'
			'Projects')
]

{ #category : #groups }
BaselineOfBioSmalltalk >> baselineBasicGroup: spec [

	spec
		group: 'Basic'
		with: #(
			'BioTools' 
			'BioPharoCommon'
			'BioNCBI'
			'BioBlast'
			'BioParsers'
			'BioFormatters')
]

{ #category : #groups }
BaselineOfBioSmalltalk >> baselineCoreGroup: spec [

	spec 
		group: 'Core' 
		with: #(
			'Basic'
		
			'BioWrappers' 
			'BioEntrez' 
			'BioClassifier' 
			'BioEBI' 
			'BioToolsSamples' 
			'BioBlastSamples' 
			'BioHaplotypes' 
			'BioBenchmarks' 
			'BioNGS'
			'BioPlots' )
]

{ #category : #groups }
BaselineOfBioSmalltalk >> baselineGroups: spec [

	self baselineCoreGroup: spec.
	self baselineBasicGroup: spec.
	self baselinePopGenGroup: spec.
	self baselineProjectsGroup: spec.
	self baselineTestsGroup: spec.
	self baselineAllGroup: spec.
	spec group: 'default' with: #('All').
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineOSDeps: spec [

	spec
		for: #(Unix MacOS)
		do: [
			self projectSpecForOsSubprocess: spec.
			spec package: 'BioWrappers' with: [ spec requires: #('OSSubprocess') ] ].

	spec
		for: #Windows
		do: [ 
			self projectSpecForProcessWrapper: spec.
			spec package: 'BioWrappers' with: [ spec requires: #('ProcessWrapper') ] ].
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselinePackages: spec [

		spec
			package: 'BioAffymetrix' 			with: [ spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' 				with: [ spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioTools-Tests' 'INIFile' ). ];
			package: 'BioBenchmarks' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioBlast' 					with: [ spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' 			with: [ spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' 			with: [ spec requires: #('BioTools-Tests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' 		with: [ spec requires: #('BioTools-Tests' 'BioClassifier' ). ];
			package: 'BioEBI' 						with: [ spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioArlequin-Tests'		with: [ spec requires: #('BioArlequin'). ];
			package: 'BioEntrez' 					with: [ spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' 			with: [ spec requires: #('BioTools-Tests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' 		with: [ spec requires: #('BioTools-Tests' 'BioFormatters' ). ];
			package: 'BioFormatters' 			with: [ spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioLAMPLD' 					with: [ spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' 					with: [ spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' 				with: [ spec requires: #('BioTools-Tests' 'BioNCBI' ). ];
			package: 'BioNGS' 						with: [ spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioParserTests' 			with: [ spec requires: #('BioTools-Tests' 'BioParsers' ). ];
			package: 'BioParsers' 				with: [ spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioPharoCommon' 			with: [ spec requires: #('BioTools' ). ];									
			package: 'BioPharo4' 					with: [ spec requires: #('BioPharoCommon' ). ];
			package: 'BioPharo7' 					with: [ spec requires: #('BioPharoCommon' ). ];
			package: 'BioPlots'					with: [ spec requires: #('BioTools' 'Roassal2') ];												
			package: 'BioPopulation' 			with: [ spec requires: #('BioTools' 'BioSupport'). ];
			package: 'BioProject' 				with: [ spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' 			with: [ spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' 		with: [ spec requires: #('BioTools' ). ];
			package: 'BioSupport' 				with: [ spec requires: #('BioTools'). ];
			package: 'BioTools' 					with: [ spec 
																	requires: #('CommonUtils' 'StringExtensions' 'PetitParser2Core' 'PolyMath' 'XMLParser' 'XMLPullParser');
																	includes: #('BioPharoCommon') ];
			package: 'BioToolsSamples' 			with: [ spec requires: #('BioTools' 'BioEntrez' 'BioParsers' ). ];
			package: 'BioTools-Tests' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' 			with: [ spec requires: #('BioTools-Tests' ). ];
			package: 'BioWrappers' 				with: [ spec requires: #('BioTools' ) ]

]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselinePharo: spec [

	spec for: #(#'pharo4.x' #'pharo5.x' #'pharo6.x') do: [ 
		self projectSpecForXMLPharo7: spec.
		spec 
			package: 'BioTools'	with: [ spec includes: #('BioPharo4') ];
			package: 'BioPharo4'	with: [ spec requires: #('BioTools') ];
			group: 'Basic' with: #('BioPharo4')  ].

	spec for: #'pharo7.x' do: [ 
		self projectSpecForXMLPharo7: spec.
		spec 
			package: 'BioTools'	with: [ spec includes: #('BioPharo7') ];
			package: 'BioPharo7'	with: [ spec requires: #('BioTools' 'FileDialog') ];
			group: 'Basic' with: #('BioPharo7') ].

	spec for: #(#'pharo8.x' #'pharo9.x' #'pharo10.x' #'pharo11.x') do: [ 
		self projectSpecForXMLPharo8: spec.
		spec 
			package: 'BioTools'	with: [ spec includes: #('BioPharo7') ];
			package: 'BioPharo7'	with: [ spec requires: #('BioTools' 'FileDialog') ];
			group: 'Basic' with: #('BioPharo7') ].

]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselinePopGenGroup: spec [

	spec
		group: 'PopulationGenomics'
		with: #(
			'Core'
			'BioArlequin'
			'BioPopulation'
			'BioHaplotypes' 
			'BioLAMPLD')
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineProjectsGroup: spec [

	spec
		group: 'Projects'
		with: #(
			'Core'
			'BioProject' 
			'BioSoftwareCatalog')
]

{ #category : #baselines }
BaselineOfBioSmalltalk >> baselineTestsGroup: spec [

	spec			
		group: 'Tests' 
		with: #(
			'Core'	
			'Projects'

			'BioTools-Tests' 
			'BioBlastTests' 
			'BioWrapperTests' 
			'BioParserTests' 
			'BioEntrezTests' 
			'BioNCBITests' 
			'BioFormatterTests' 
			'BioClassifierTests' 
			'BioProjectTests'
			'BioArlequin-Tests' )
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

{ #category : #doits }
BaselineOfBioSmalltalk >> platformFilesUrl [
	" Private - See superimplementor's comment "

	^ Array with: (String streamContents: [ : stream |		
		stream 			
			nextPutAll: 'https://github.com/hernanmd/BioSmalltalk/raw/master/resources/BioSmalltalkResourceFiles';
			nextPutAll: (
				Smalltalk os isWin32 					
					ifTrue: [ '.zip' ]
					ifFalse: [ '.tar.gz' ]) ]).

]

{ #category : #doits }
BaselineOfBioSmalltalk >> postLoad [
	" Private - If Pharo >=7 set the FileDialog package as default "

	(Smalltalk hasClassNamed: #FDMorphicUIManager) ifTrue: [
		(Smalltalk at: #FDMorphicUIManager) new beDefault ].
]

{ #category : #doits }
BaselineOfBioSmalltalk >> preLoad [
	" Private - See superimplementor's comment "

    self ensureMetacelloFileDownload.
    super preLoad.
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForCommonUtils: spec [

	spec 
		baseline: 'CommonUtils'
		with: [ spec repository: 'github://hernanmd/CommonUtils/repository' ]
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForDataDrameInspector: spec [

	spec 
		baseline: 'AIDataFrameInspector' 
		with: [ spec repository: 'github://pharo-ai/data-inspector/src' ]

]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForFileDialog: spec [

	spec
		baseline: 'FileDialog' 
		with: [ spec repository: 'github://hernanmd/file-dialog/repository' ]
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForINIParser: spec [

	spec
		baseline: 'INIFile' 
		with: [ spec repository: 'github://hernanmd/Pharo-INIFile/repository' ]

]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForOsSubprocess: spec [

	spec 
		baseline: 'OSSubprocess' 
		with: [ spec repository: 'github://pharo-contributions/OSSubprocess:master/repository' ]

]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForPetitParser: spec [

	spec
		baseline: 'PetitParser2Core'	
		with: [ spec repository: 'github://kursjan/petitparser2' ].

]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForPolyMath: spec [

	spec
		baseline: 'PolyMath'	
		with: [ spec 
						repository: 'github://PolyMathOrg/PolyMath:master/src';
						loads: #('Core' 'Extensions' 'Accuracy') ].
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForProcessWrapper: spec [

	spec 
		baseline: 'ProcessWrapper' 
		with: [ spec repository: 'github://hernanmd/ProcessWrapper' ]

]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForProjectFramework: spec [

	spec 
		baseline: 'ProjectFramework' 
		with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ]
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForRoassal2: spec [

	spec
		baseline: 'Roassal2' 
		with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].

]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForStringExtensions: spec [

	spec
		baseline: 'StringExtensions' 
		with: [ spec repository: 'github://hernanmd/StringExtensions/repository' ]
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForXMLPharo7: spec [

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
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ]
]

{ #category : #specs }
BaselineOfBioSmalltalk >> projectSpecForXMLPharo8: spec [

	spec
		baseline: 'XMLParser' 
		with: [ 
			spec 
				repository: 'github://pharo-contributions/XML-XMLParser/src';
				loads: 'Core' ].
	spec
		project: 'XMLPullParser' with: [
			spec
				className: #ConfigurationOfXMLPullParser;
				versionString: #'development';
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ]
]
