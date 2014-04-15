baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
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
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main/' ].
		spec 
			package: 'BioTools';
			package: 'BioNCBI' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioWrappers' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParsers' with: [
				spec requires: #('BioWrappers' ). ];
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
			package: 'BioToolsTests' with: [
				spec requires: #('BioTools' ). ];
			package: #BioPharo3 with: [
				spec requires: #('BioTools' ). ];
			package: 'BioParserTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioNCBITests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioBlastTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioEntrezTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioWrapperTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioFormatterTests' with: [
				spec requires: #('BioBlastTests' ). ];
			package: 'BioClassifierTests' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioHaplotypesTest' with: [
				spec requires: #('BioToolsTests' ). ];
			package: 'BioSupport' with: [
				spec requires: #('BioTools' ). ];
			package: 'BioPopulation' with: [
				spec requires: #('BioTools' 'BioSupport' ). ];
			package: 'BioPopulation-Tests' with: [
				spec requires: #('BioToolsTests' 'BioPopulation' ). ].
		spec group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo3' ). ].
