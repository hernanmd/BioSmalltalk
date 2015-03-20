menu
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'BioBrowser')
		order: 1; 
		parent: #Bio;
		label: 'BioBrowser (Nautilus)';
		icon: Smalltalk ui icons smallHierarchyBrowserIcon;
		help: 'Browse the BioSmalltalk classes' translated;
		action:[self openBioBrowser]