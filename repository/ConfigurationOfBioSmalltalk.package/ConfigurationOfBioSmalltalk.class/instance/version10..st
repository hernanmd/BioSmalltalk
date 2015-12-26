versions
version10: spec
	<version: '1.0' imports: #('0.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.0'.
		spec author: 'HernanMoralesDurand'.
		spec timestamp: '12/25/2015 19:15'.
		spec 
			project: 'Grease' with: '1.2.2';
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
			project: 'INIFileSupport' with: '0.1-baseline'.
		spec 
			package: 'BioTools' with: 'BioTools';
			package: 'BioNCBI' with: 'BioNCBI';
			package: 'BioWrappers' with: 'BioWrappers';
			package: 'BioParsers' with: 'BioParsers';
			package: 'BioEntrez' with: 'BioEntrez';
			package: 'BioBlast' with: 'BioBlast';
			package: 'BioFormatters' with: 'BioFormatters';
			package: 'BioClassifier' with: 'BioClassifier';
			package: 'BioEBI' with: 'BioEBI';
			package: 'BioToolsSamples' with: 'BioToolsSamples';
			package: 'BioBlastSamples' with: 'BioBlastSamples';
			package: 'BioHaplotypes' with: 'BioHaplotypes';
			package: 'BioBenchmarks' with: 'BioBenchmarks';
			package: 'BioSoftwareCatalog' with: 'BioSoftwareCatalog';
			package: 'BioIllumina' with: 'BioIllumina';
			package: #BioPharo4 with: #BioPharo4;
			package: 'BioSupport' with: 'BioSupport';
			package: 'BioPopulation' with: 'BioPopulation';
			package: 'BioToolsTests' with: 'BioToolsTests';
			package: 'BioWrapperTests' with: 'BioWrapperTests';
			package: 'BioParserTests' with: 'BioParserTests';
			package: 'BioBlastTests' with: 'BioBlastTests';
			package: 'BioEntrezTests' with: 'BioEntrezTests';
			package: 'BioNCBITests' with: 'BioNCBITests';
			package: 'BioFormatterTests' with: 'BioFormatterTests';
			package: 'BioClassifierTests' with: 'BioClassifierTests';
			package: 'BioProject' with: 'BioProject';
			package: 'BioProjectTests' with: 'BioProjectTests';
			package: 'BioArlequin' with: 'BioArlequin';
			package: #BioLAMPLD with: #BioLAMPLD;
			package: #BioAffymetrix with: #BioAffymetrix. ].
