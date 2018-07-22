baselines
baseline: spec
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
			baseline: 'PolyMath'	 			with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ];
				
			project: 'INIFileSupport' with: [
				spec
					className: #ConfigurationOfINIFileSupport;
					versionString: '0.1-baseline';
					repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ];
				
			project: 'NeoCSV' with: [
				spec
					className: 'ConfigurationOfNeoCSV';
					version: #stable;
					repository: 'github://svenvc/NeoCVS:master/repository' ];
				
			project: 'PetitParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: '2.0';
					loads: #('Core' );
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ];

			project: 'Roassal2' with: [
				spec
					className: #ConfigurationOfRoassal2;
					versionString: #'stable';
					loads: #('NoGlamour' );
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ];

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
			for: #(unix macos)
			do: [
				spec 
					configuration: 'OSSubprocess' 
					with: [ 
						spec 
							versionString: #stable; 
							repository: 'github://marianopeck/OSSubprocess/repository' ].
				spec
					package: 'BioWrappers'
					with: [ spec requires: #('OSSubprocess') ] ].

		spec
			for: #Windows
			do: [ 
				spec
					project: 'ProcessWrapper' with: [
						spec
							className: #ConfigurationOfProcessWrapper;
							versionString: #'development';
							repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].
				spec
					package: 'BioWrappers'
					with: [ spec requires: #('ProcessWrapper') ] ].

		spec 
			package: 'BioAffymetrix' 				with: [ spec requires: 
#('BioFormatters' 'BioTools' ). ];
			package: 'BioArlequin' 				with: [ spec requires: #('BioTools' 'BioFormatters' 'BioSupport' 'BioToolsTests' 'NeoCSV' 'INIFileSupport' ). ];
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
			package: 'BioLAMPLD' 					with: [ spec requires: 
#('BioTools' 'BioWrappers' 'BioFormatters' ). ];
			package: 'BioNCBI' 					with: [ spec requires: #('BioTools' ). ];
			package: 'BioNCBITests' 				with: [ spec requires: #('BioToolsTests' 'BioNCBI' ). ];
			package: 'BioNGS' 						with: [ spec requires: #('BioTools' 'BioWrappers' ). ];
			package: 'BioParserTests' 			with: [ spec requires: #('BioToolsTests' 'BioParsers' ). ];
			package: 'BioParsers' 				with: [ spec requires: #('BioWrappers' 'BioTools' ). ];
			package: 'BioPharo4' 					with: [ spec requires: 
#('BioTools' ). ];
			package: 'BioPopulation' 			with: [ spec requires: #('BioTools' 'BioSupport' 'BioPharo4' ). ];
			package: 'BioProject' 				with: [ spec requires: #('BioTools' 'ProjectFramework' ). ];
			package: 'BioProjectTests' 			with: [ spec requires: #('BioProject' ). ];
			package: 'BioSoftwareCatalog' 		with: [ spec requires: #('BioTools' ). ];
			package: 'BioSupport' 				with: [ spec requires: #('BioTools' ). ];
			package: 'BioTools' 					with: [ spec requires: #('CommonUtils' 'StringExtensions' ). ];
			package: 'BioToolsSamples' 			with: [ spec requires: #('BioTools' 'BioEntrez' 'BioParsers' ). ];
			package: 'BioToolsTests' 			with: [ spec requires: #('BioTools' ). ];
			package: 'BioWrapperTests' 			with: [ spec requires: #('BioToolsTests' ). ];
			package: 'BioWrappers' 				with: [ spec requires: #('BioTools' ). ].

		spec 
			group: 'Core' with: #('BioTools' 'BioNCBI' 'BioWrappers' 'BioEntrez' 'BioBlast' 'BioParsers' 'BioFormatters' 'BioPopulation' 'BioClassifier' 'BioEBI' 'BioToolsSamples' 'BioBlastSamples' 'BioHaplotypes' 'BioBenchmarks' 'BioSoftwareCatalog' 'BioIllumina' 'BioPharo4' 'BioProject' 'BioNGS' );
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ). ].
