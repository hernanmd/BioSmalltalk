baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec 
				preLoadDoIt: #preLoad.
			spec
				baseline: 'CommonUtils' 	with: [ spec repository: 'github://hernanmd/CommonUtils/repository' ];
				baseline: 'SpecUIAddOns' with: [ spec repository: 'github://hernanmd/SpecUIAddOns/repository' ];
				baseline: 'CodeGenerator' with: [ spec repository: 'github://hernanmd/CodeGenerator/repository' ];
				baseline: 'NeoCSV' with: [ spec repository: 'github://seandenigris/NeoCSV/repository' ];
				baseline: 'OSSubprocess' with: [ spec repository: 'github://marianopeck/OSSubprocess:v0.2.5/repository' ];
				baseline: 'ProjectFramework' with: [ spec repository: 'github://hernanmd/ProjectFramework/repository' ].
				
			spec
				project: 'ProcessWrapper' with: [
					spec
						className: #ConfigurationOfProcessWrapper;
						versionString: #'development';
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].
			spec
				project: 'PolyMath' with: [
					spec
						className: #ConfigurationOfPolyMath;
						versionString: #'stable';
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].				
			spec
				project: 'PetitParser' with: [
					spec
						className: #ConfigurationOfPetitParser;
						versionString: '2.0';
						loads: #('Core' );
						repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main/' ].
			spec
				project: 'XMLParser' with: [
					spec
						className: #ConfigurationOfXMLParser;
						versionString: #'stable';
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main/' ].				
			spec				
				project: 'INIFileSupport' with: [
					spec
						className: #ConfigurationOfINIFileSupport;
						versionString: '0.1-baseline';
						repository: 'http://smalltalkhub.com/mc/hernan/INIParser/main/' ].

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
			group: 'Tests' with: #('BioToolsTests' 'BioBlastTests' 'BioWrapperTests' 'BioParserTests' 'BioEntrezTests' 'BioNCBITests' 'BioFormatterTests' 'BioClassifierTests' 'BioProjectTests' ).  ].