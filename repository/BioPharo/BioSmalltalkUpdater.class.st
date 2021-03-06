Class {
	#name : #BioSmalltalkUpdater,
	#superclass : #ObjectExplorer,
	#category : 'BioPharo-Platform'
}

{ #category : #menu }
BioSmalltalkUpdater class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: #'Browser')
		order: 2;
		parent: #Bio;
		label: 'Update BioSmalltalk';
		icon: UITheme current smallUpdateIcon;
		action:[self updateBioSmalltalk]
]

{ #category : #menu }
BioSmalltalkUpdater class >> updateBioSmalltalk [
	" Update the system "

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
		package: 'BioPlatform';
	    	load.
		
	self inform: 'Update done successfully' translated.

]
