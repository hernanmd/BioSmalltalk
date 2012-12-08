menu
updateBioSmalltalk

	Gofer new
		url: 'http://ss3.gemstone.com/ss/BioSmalltalk';
		package: 'Territorial';
		package: 'TerritorialTests';

	    	package: 'BioTools';
	    	package: 'BioToolsTests';

	    	package: 'BioFormatters';
	    	package: 'BioFormatterTests';	

	    	package: 'BioParsers';
	    	package: 'BioParserTests';

	    	package: 'BioNCBI';
	    	package: 'BioNCBITests';

	    	package: 'BioWrappers';
	    	package: 'BioWrapperTests';
		
	    	package: 'BioBlast';
	    	package: 'BioBlastTests';
    	
	    	package: 'BioSupport';
    	
	    	package: 'BioProject';
	    	package: 'BioProjectTests';		

	    	package: 'BioEntrez';	
	    	package: 'BioEntrezTests';
    	
	    	package: 'BioPharo';
	
		package: 'BioClassifier';
		package: 'BioClassifierTests';
	
	    	package: 'BioPopulation';
	    	package: 'BioArlequin';							
	    	package: 'BioToolsSamples';
	    	load.
		
	self inform: 'Update done successfully' translated.
