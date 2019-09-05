"
BioSmalltalk is an open source library for doing bioinformatics with Smalltalk. BioSmalltalk enables you to build bioinformatics scripts and applications using the most powerful object technology as of today, the Smalltalk programming environment.

"
Class {
	#name : #ConfigurationOfBioSmalltalk,
	#superclass : #Object,
	#instVars : [
		'project',
		'fileRef'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfBioSmalltalk'
}

{ #category : #'development support' }
ConfigurationOfBioSmalltalk class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfBioSmalltalk class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfBioSmalltalk class >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	^ ''
]

{ #category : #catalog }
ConfigurationOfBioSmalltalk class >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	
	^ 'You can get in contact with the author of BioSmalltalk at hernan.morales@gmail.com'
]

{ #category : #catalog }
ConfigurationOfBioSmalltalk class >> catalogDescription [
	"Returns a paragraph describing the project"
	^ 'BioSmalltalk is an open source library for doing bioinformatics with Smalltalk. BioSmalltalk enables you to build bioinformatics scripts and applications using the most powerful object technology as of today, the Smalltalk programming environment.'
]

{ #category : #catalog }
ConfigurationOfBioSmalltalk class >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ 'BioSmalltalk contains:
	
- Basic biological objects, like BioSequence, BioSeqRecord, BioAlignment, BioFastaRecord, BioCodonTable, etc
- BLAST objects for querying and filtering results from NCBI or locally. Tests and examples are included.
- Entrez system API with tests and examples
- Writers for formatted files as CSV, FASTA, HaploView, Fluxus Network, etc.
- Parsers for reading formatted files like XML, FASTA, NCBI identifiers or DNA sequences with degenerate bases as sent from Illumina reports, i.e. of the form : ''A[A/C]CTG'' or ''AT[A/C]TA[C/A]''.
- Tools, for creating custom views of objects using inspectors, explorers or browsers. 
'
]

{ #category : #catalog }
ConfigurationOfBioSmalltalk class >> catalogKeywords [
	"Returns an array of symbols"
	^ #(bioinformatics biology dna science protein rna blast) 
]

{ #category : #private }
ConfigurationOfBioSmalltalk class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfBioSmalltalk class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfBioSmalltalk class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfBioSmalltalk class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfBioSmalltalk class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfBioSmalltalk class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfBioSmalltalk class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfBioSmalltalk class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline010: spec [
	<version: '0.10-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.		
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'CommonUtils' with: [
				spec
					className: #ConfigurationOfCommonUtils;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CommonUtils/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'stable';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'release-2.5';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: #BioNGS with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioTools' with: [
				spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline011: spec [
	<version: '0.11-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.		
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: '1.0';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'CommonUtils' with: [
				spec
					className: #ConfigurationOfCommonUtils;
					versionString: '1.1';
					repository: 'http://smalltalkhub.com/mc/hernan/CommonUtils/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: '1.2.7';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: '0.1-baseline';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: '13';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: '4.6.4';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '2.0';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: '1.2';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'development';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: '1.44';
					loads: #('NoGlamour' );
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: '1.1';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: '2.5.2';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: '1.0-baseline';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: '2.7.5';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioNGS' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioTools' with: [
				spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' 'BioEntrez' 'BioParsers' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' 'BioNGS' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline012: spec [
	<version: '0.12-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'CommonUtils' with: [
				spec
					className: #ConfigurationOfCommonUtils;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/hernan/CommonUtils/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: '0.1-baseline';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '2.0';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'PolyMath' with: [
				spec
					className: #ConfigurationOfPolyMath;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'development';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					loads: #('NoGlamour' );
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
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
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioNGS' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioTools' with: [
				spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' 'BioEntrez' 'BioParsers' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' 'BioNGS' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.		
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'FFI' with: [
				spec
					className: #ConfigurationOfFFI;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/Grease/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/ProcessWrapper/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ].
		spec 
			package: 'BioTools';
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSoftwareCatalog';
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioPharo3 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo3' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline02: spec [
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.						
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];				
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo40/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ].
		spec 
			package: 'BioTools';
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSoftwareCatalog';
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' ). ];
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline03: spec [
	<version: '0.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.						
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];						
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ].
		spec 
			package: 'BioTools';
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSoftwareCatalog';
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' ). ];
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline04: spec [
	<version: '0.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.		
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: 'BioTools';
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSoftwareCatalog';
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' ). ];
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline05: spec [
	<version: '0.5-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.						
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: 'BioTools';
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSoftwareCatalog';
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' ). ];
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline06: spec [
	<version: '0.6-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'development';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'release-2.5';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers'). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters'). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4'). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework'). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: ('BioTools') ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioTools';
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline07: spec [
	<version: '0.7-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.		
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'CommonUtils' with: [
				spec
					className: #ConfigurationOfCommonUtils;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CommonUtils/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'stable';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'release-2.5';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioTools' with: [
				spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline08: spec [
	<version: '0.8-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'CommonUtils' with: [
				spec
					className: #ConfigurationOfCommonUtils;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CommonUtils/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'stable';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					loads: #('NoGlamour' );
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'release-2.5';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioTools' with: [
				spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #baselines }
ConfigurationOfBioSmalltalk >> baseline09: spec [
	<version: '0.9-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec preLoadDoIt: #preLoad.			
		spec repository: 'http://smalltalkhub.com/mc/hernan/BioSmalltalk/main/'.
		spec 
			project: 'CodeGenerator' with: [
				spec
					className: #ConfigurationOfCodeGenerator;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CodeGenerator/main/' ];
			project: 'CommonUtils' with: [
				spec
					className: #ConfigurationOfCommonUtils;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/CommonUtils/main/' ];
			project: 'Grease' with: [
				spec
					className: #ConfigurationOfGrease;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
			project: 'NeoCSV' with: [
				spec
					className: #ConfigurationOfNeoCSV;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'NumericalMethods' with: [
				spec
					className: #ConfigurationOfNumericalMethods;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ];
			project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];
			project: 'ProcessWrapper' with: [
				spec
					className: #ConfigurationOfProcessWrapper;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'ProjectFramework' with: [
				spec
					className: #ConfigurationOfProjectFramework;
					versionString: #'stable';
					loads: #('Basic' );
					repository: 'http://smalltalkhub.com/mc/hernan/ProjectFramework/main/' ];
			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'StringExtensions' with: [
				spec
					className: #ConfigurationOfStringExtensions;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/hernan/StringExtensions/main/' ];
			project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'release-2.5';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLPullParser' with: [
				spec
					className: #ConfigurationOfXMLPullParser;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ];
			project: 'XMLWriter' with: [
				spec
					className: #ConfigurationOfXMLWriter;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: #BioAffymetrix with: [
				spec requires: #('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' with: [
				spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
			package: 'BioBenchmarks' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioBlast' with: [
				spec requires: #('BioWrappers' 'BioParsers' 'BioEntrez' ). ];
			package: 'BioBlastSamples' with: [
				spec requires: #('BioToolsSamples' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' 'BioBlast' 'BioParserTests' ). ];
			package: 'BioClassifier' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' 'BioClassifier' ). ];
			package: 'BioEBI' with: [
				spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioEntrez' with: [
				spec requires: #('BioWrappers' 'BioParsers' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' 'BioEntrez' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioToolsTests' 'BioFormatters' ). ];
			package: 'BioFormatters' with: [
				spec requires: #('BioParsers' ). ];
			package: 'BioHaplotypes' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioIllumina' with: [
				spec requires: #('BioTools' ). ];
			package: #BioLAMPLD with: [
				spec requires: #('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' 'BioTools' ). ];
			package: #BioPharo4 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' with: [
				spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' with: [
				spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' 'BioFormatters' ). ];
			package: 'BioTools' with: [
				spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' with: [
				spec requires: #('BioTools' 'BioEntrez' 'BioParsers' 'BioEBI' ). ];
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ].
		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].

]

{ #category : #'symbolic versions' }
ConfigurationOfBioSmalltalk >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.11-baseline'.
	spec for: #'pharo3.x' version: '0.1-baseline'.
	spec for: #'pharo4.x' version: '0.2-baseline'.
	spec for: #'pharo5.x' version: '0.11-baseline'.
	spec for: #'pharo6.x' version: '0.12-baseline'.

]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> downloadFiles: urlIndex [

	| url response |
	url := (self platformFilesUrl at: urlIndex) asZnUrl.
	fileRef := FileSystem disk workingDirectory / url pathSegments last.	
	(response :=self downloadResourcesFrom: url) isSuccess 
		ifTrue: [ fileRef writeStreamDo: [ : stream | stream nextPutAll: response contents ] ]
		ifFalse: [ self error: 'Cannot download resource files' ] 
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> downloadResourcesFrom: url [
	" Private - Answer a ZnClient "

	| webClient |

	webClient := ZnClient new.
	UIManager default informUserDuring: [ :bar |
		bar label: 'Downloading BioSmalltalk Resources ...'.
		[ webClient
			signalProgress: true;
			get: url ]
		on: HTTPProgress, ZnEntityTooLarge
		do: [ : ex |
			(ex isKindOf: (Smalltalk at: #ZnEntityTooLarge))
				ifTrue:[ ex resume ]
				ifFalse: [ | progress |
					progress := ex.
					progress isEmpty ifFalse: [ 
						bar current: progress percentage.
						progress total ifNotNil: [ :aTotalNumber |
							bar label: 'Downloading ' ] ].
					progress resume ] ] ].
	^ webClient

]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> extractGZipIn: dst [
	" Uncompress fileRef contents and delete it "

	| unZipped |
	(fileRef fullName endsWith: '.gz')
		ifFalse: [ ^ self ].
	unZipped := GZipReadStream unzip: fileRef basename to: dst.
	self unTar: unZipped.
	fileRef delete.
	unZipped asFileReference delete
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> extractZipIn: targetPath [
	" If fileRef is a ZIP archive, uncompress its contents in targetPath and delete it "

	(fileRef fullName endsWith: '.zip')
		ifFalse: [ ^ self ].
	self unZip: targetPath.
	fileRef delete
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> installOSProcess [

	Gofer new
		squeaksource: 'MetacelloRepository';
		package: 'ConfigurationOfOSProcess';
		load.
	((Smalltalk at: #ConfigurationOfOSProcess) project version: '4.6.4') load.
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> platformFilesUrl [
	" Answer a <Collection> of download URLs for the current platform "

	^ Smalltalk os isWin32 
		ifTrue: [ #(
			'https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.zip'
			'http://www.dropbox.com/s/2ch3l4oi1yl8kj5/BioSmalltalkTestFiles.zip'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.zip') ]
		ifFalse: [ #(
			'https://github.com/biosmalltalk/biopharo/raw/develop/test_files/BioSmalltalkTestFiles.tar.gz'
			'https://www.dropbox.com/s/mowezz5mscmp2tw/BioSmalltalkTestFiles.tar.gz'
			'http://igevet.fcv.unlp.edu.ar/biosmalltalk/BioSmalltalkTestFiles.tar.gz') ].
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> preLoad [

	| urlIndex |
	urlIndex := 1.
	self logCr: '====== Downloading BioSmalltalk resource files...'.	
	[ self downloadFiles: urlIndex ]
	on: ZdcPluginMissing
	do: [ : ex | 
		urlIndex := urlIndex + 1.
		ex retry ].
	self logCr: '====== Uncompressing files...'.	
	self uncompressFiles.
]

{ #category : #accessing }
ConfigurationOfBioSmalltalk >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfBioSmalltalk >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.3'.

	spec for: #'pharo4.x' version: '1.1'.

	spec for: #'pharo5.x' version: '1.3'.

]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> unTar: unZipped [

	(Smalltalk hasClassNamed: #OSProcess)
		ifFalse: [ self installOSProcess ].			
	[ (Smalltalk at: #OSProcess) thisOSProcess 
			waitForCommandOutput: 'tar xvf ' , unZipped asFileReference fullName ]
   on: Warning " AioEventHandler aioPluginPresent "
   do: [ : ex | ex resume ]
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> unZip: targetPath [

	| zipArchive |

	zipArchive := ZipArchive new.
	[ zipArchive 
		readFrom: fileRef fullName;
		extractAllTo: targetPath ] 
	ensure: [ zipArchive close ].
]

{ #category : #doits }
ConfigurationOfBioSmalltalk >> uncompressFiles [
	" Private - Uncompress fileRef to the current working directory "

	| dst |
	dst := FileSystem workingDirectory.
	self extractZipIn: dst.
	self extractGZipIn: dst.
]

{ #category : #versions }
ConfigurationOfBioSmalltalk >> version11: spec [
	<version: '1.1' imports: #('0.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.1'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '12/26/2015 04:31'.
		spec 
			project: 'Grease' with: '1.2.4';
			project: 'PetitParser' with: '1.14';
			project: 'OSProcess' with: '4.6.4';
			project: 'NeoCSV' with: '12';
			project: 'NumericalMethods' with: '1.1';
			project: 'CodeGenerator' with: '1.0';
			project: 'XMLParser' with: '2.5.4';
			project: 'XMLPullParser' with: '1.6';
			project: 'XMLWriter' with: '2.6.6';
			project: 'StringExtensions' with: '0.1-baseline';
			project: 'ProcessWrapper' with: '1.1';
			project: 'INIFileSupport' with: '0.1-baseline';
			project: 'Roassal2' with: '1.20'.			
		spec 
			package: 'BioTools' with: 'BioTools-HernanMoralesDurand.183';
			package: 'BioNCBI' with: 'BioNCBI-HernanMoralesDurand.18';
			package: 'BioWrappers' with: 'BioWrappers-HernanMoralesDurand.39';
			package: 'BioParsers' with: 'BioParsers-HernanMoralesDurand.92';
			package: 'BioEntrez' with: 'BioEntrez-HernanMoralesDurand.48';
			package: 'BioBlast' with: 'BioBlast-HernanMoralesDurand.118';
			package: 'BioFormatters' with: 'BioFormatters-HernanMoralesDurand.92';
			package: 'BioClassifier' with: 'BioClassifier-HernanMoralesDurand.62';
			package: 'BioEBI' with: 'BioEBI-HernanMoralesDurand.2';
			package: 'BioToolsSamples' with: 'BioToolsSamples-HernanMoralesDurand.12';
			package: 'BioBlastSamples' with: 'BioBlastSamples-HernanMoralesDurand.6';
			package: 'BioHaplotypes' with: 'BioHaplotypes-HernanMoralesDurand.3';
			package: 'BioBenchmarks' with: 'BioBenchmarks-HernanMoralesDurand.3';
			package: 'BioSoftwareCatalog' with: 'BioSoftwareCatalog-HernanMoralesDurand.2';
			package: 'BioIllumina' with: 'BioIllumina-HernanMoralesDurand.5';
			package: #BioPharo4 with: 'BioPharo4-HernanMoralesDurand.10';
			package: 'BioSupport' with: 'BioSupport-HernanMoralesDurand.26';
			package: 'BioPopulation' with: 'BioPopulation-HernanMoralesDurand.69';
			package: 'BioToolsTests' with: 'BioToolsTests-HernanMoralesDurand.35';
			package: 'BioWrapperTests' with: 'BioWrapperTests-hfm.4';
			package: 'BioParserTests' with: 'BioParserTests-HernanMoralesDurand.17';
			package: 'BioBlastTests' with: 'BioBlastTests-HernanMoralesDurand.41';
			package: 'BioEntrezTests' with: 'BioEntrezTests-HernanMoralesDurand.14';
			package: 'BioNCBITests' with: 'BioNCBITests-hfm.3';
			package: 'BioFormatterTests' with: 'BioFormatterTests-HernanMoralesDurand.21';
			package: 'BioClassifierTests' with: 'BioClassifierTests-HernanMoralesDurand.7';
			package: 'BioProject' with: 'BioProject-HernanMoralesDurand.28';
			package: 'BioProjectTests' with: 'BioProjectTests-HernanMoralesDurand.7';
			package: 'BioArlequin' with: 'BioArlequin-HernanMoralesDurand.44';
			package: #BioLAMPLD with: 'BioLAMPLD-HernanMoralesDurand.17';
			package: #BioAffymetrix with: 'BioAffymetrix-HernanMoralesDurand.1'. ].

]

{ #category : #versions }
ConfigurationOfBioSmalltalk >> version12: spec [
	<version: '1.2' imports: #('0.6-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.2'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '12/27/2015 01:53'.
		spec 
			project: 'Grease' with: '1.2.4';
			project: 'PetitParser' with: '1.14';
			project: 'OSProcess' with: '4.6.4';
			project: 'NeoCSV' with: '13';
			project: 'NumericalMethods' with: '1.1';
			project: 'CodeGenerator' with: '1.0';
			project: 'XMLParser' with: '2.5.0';
			project: 'XMLPullParser' with: '1.6';
			project: 'XMLWriter' with: '2.6.6';
			project: 'StringExtensions' with: '0.1-baseline';
			project: 'ProcessWrapper' with: '1.1';
			project: 'INIFileSupport' with: '0.1-baseline';
			project: 'ProjectFramework' with: '0.1-baseline';
			project: 'Roassal2' with: '1.20'.			
		spec 
			package: 'BioTools' with: 'BioTools-HernanMoralesDurand.184';
			package: 'BioNCBI' with: 'BioNCBI-HernanMoralesDurand.18';
			package: 'BioWrappers' with: 'BioWrappers-HernanMoralesDurand.39';
			package: 'BioParsers' with: 'BioParsers-HernanMoralesDurand.94';
			package: 'BioEntrez' with: 'BioEntrez-HernanMoralesDurand.48';
			package: 'BioBlast' with: 'BioBlast-HernanMoralesDurand.118';
			package: 'BioFormatters' with: 'BioFormatters-HernanMoralesDurand.92';
			package: 'BioClassifier' with: 'BioClassifier-HernanMoralesDurand.62';
			package: 'BioEBI' with: 'BioEBI-HernanMoralesDurand.2';
			package: 'BioToolsSamples' with: 'BioToolsSamples-HernanMoralesDurand.12';
			package: 'BioBlastSamples' with: 'BioBlastSamples-HernanMoralesDurand.6';
			package: 'BioHaplotypes' with: 'BioHaplotypes-HernanMoralesDurand.3';
			package: 'BioBenchmarks' with: 'BioBenchmarks-HernanMoralesDurand.3';
			package: 'BioSoftwareCatalog' with: 'BioSoftwareCatalog-HernanMoralesDurand.2';
			package: 'BioIllumina' with: 'BioIllumina-HernanMoralesDurand.5';
			package: 'BioPharo4' with: 'BioPharo4-HernanMoralesDurand.10';
			package: 'BioSupport' with: 'BioSupport-HernanMoralesDurand.26';
			package: 'BioPopulation' with: 'BioPopulation-HernanMoralesDurand.69';
			package: 'BioToolsTests' with: 'BioToolsTests-HernanMoralesDurand.35';
			package: 'BioWrapperTests' with: 'BioWrapperTests-hfm.4';
			package: 'BioParserTests' with: 'BioParserTests-HernanMoralesDurand.17';
			package: 'BioBlastTests' with: 'BioBlastTests-HernanMoralesDurand.43';
			package: 'BioEntrezTests' with: 'BioEntrezTests-HernanMoralesDurand.14';
			package: 'BioNCBITests' with: 'BioNCBITests-hfm.3';
			package: 'BioFormatterTests' with: 'BioFormatterTests-HernanMoralesDurand.21';
			package: 'BioClassifierTests' with: 'BioClassifierTests-HernanMoralesDurand.7';
			package: 'BioProject' with: 'BioProject-HernanMoralesDurand.28';
			package: 'BioProjectTests' with: 'BioProjectTests-HernanMoralesDurand.7';
			package: 'BioArlequin' with: 'BioArlequin-HernanMoralesDurand.45';
			package: 'BioLAMPLD' with: 'BioLAMPLD-HernanMoralesDurand.17';
			package: 'BioAffymetrix' with: 'BioAffymetrix-HernanMoralesDurand.1'. ].

]

{ #category : #versions }
ConfigurationOfBioSmalltalk >> version13: spec [
	<version: '1.3' imports: #('0.7-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.3'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '4/1/2017 03:32'.
		spec 
			project: 'CodeGenerator' with: '1.0';
			project: 'CommonUtils' with: '1.1';
			project: 'Grease' with: '1.2.7';
			project: 'INIFileSupport' with: '0.1-baseline';
			project: 'NeoCSV' with: '13';
			project: 'NumericalMethods' with: '1.1';
			project: 'OSProcess' with: '4.6.4';
			project: 'PetitParser' with: '2.0';
			project: 'ProcessWrapper' with: '1.2';
			project: 'ProjectFramework' with: '1.0';
			project: 'Roassal2' with: '1.44';
			project: 'StringExtensions' with: '1.1';
			project: 'XMLParser' with: '2.5.2';
			project: 'XMLPullParser' with: '1.0-baseline';
			project: 'XMLWriter' with: '2.7.5'.
		spec 
			package: #BioAffymetrix with: 'BioAffymetrix-HernanMoralesDurand.6';
			package: 'BioArlequin' with: 'BioArlequin-HernanMoralesDurand.46';
			package: 'BioBenchmarks' with: 'BioBenchmarks-HernanMoralesDurand.3';
			package: 'BioBlast' with: 'BioBlast-HernanMoralesDurand.121';
			package: 'BioBlastSamples' with: 'BioBlastSamples-HernanMoralesDurand.6';
			package: 'BioBlastTests' with: 'BioBlastTests-HernanMoralesDurand.44';
			package: 'BioClassifier' with: 'BioClassifier-HernanMoralesDurand.64';
			package: 'BioClassifierTests' with: 'BioClassifierTests-HernanMoralesDurand.7';
			package: 'BioEBI' with: 'BioEBI-HernanMoralesDurand.2';
			package: 'BioEntrez' with: 'BioEntrez-HernanMoralesDurand.50';
			package: 'BioEntrezTests' with: 'BioEntrezTests-HernanMoralesDurand.15';
			package: 'BioFormatterTests' with: 'BioFormatterTests-HernanMoralesDurand.21';
			package: 'BioFormatters' with: 'BioFormatters-HernanMoralesDurand.103';
			package: 'BioHaplotypes' with: 'BioHaplotypes-HernanMoralesDurand.4';
			package: 'BioIllumina' with: 'BioIllumina-HernanMoralesDurand.5';
			package: #BioLAMPLD with: 'BioLAMPLD-HernanMoralesDurand.44';
			package: 'BioNCBI' with: 'BioNCBI-HernanMoralesDurand.20';
			package: 'BioNCBITests' with: 'BioNCBITests-hfm.3';
			package: 'BioParserTests' with: 'BioParserTests-HernanMoralesDurand.17';
			package: 'BioParsers' with: 'BioParsers-HernanMoralesDurand.103';
			package: #BioPharo4 with: 'BioPharo4-HernanMoralesDurand.17';
			package: 'BioPopulation' with: 'BioPopulation-HernanMoralesDurand.73';
			package: 'BioProject' with: 'BioProject-HernanMoralesDurand.36';
			package: 'BioProjectTests' with: 'BioProjectTests-HernanMoralesDurand.9';
			package: 'BioSoftwareCatalog' with: 'BioSoftwareCatalog-HernanMoralesDurand.7';
			package: 'BioSupport' with: 'BioSupport-HernanMoralesDurand.32';
			package: 'BioTools' with: 'BioTools-HernanMoralesDurand.220';
			package: 'BioToolsSamples' with: 'BioToolsSamples-HernanMoralesDurand.13';
			package: 'BioToolsTests' with: 'BioToolsTests-HernanMoralesDurand.38';
			package: 'BioWrapperTests' with: 'BioWrapperTests-hfm.4';
			package: 'BioWrappers' with: 'BioWrappers-HernanMoralesDurand.58'. ].

]
