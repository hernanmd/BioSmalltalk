baselines
baseline06: spec
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
					versionString: #'stable';
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
