versions
version12: spec
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
			project: 'XMLParser' with: '2.5.4';
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
