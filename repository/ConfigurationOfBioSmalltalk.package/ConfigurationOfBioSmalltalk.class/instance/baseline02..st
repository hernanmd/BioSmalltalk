baselines
baseline02: spec
	<version: '0.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
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
