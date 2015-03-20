menu
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'Browser')
		order: 1; 
		parent: #Bio;
		label: 'Browser (Classic)';
		icon: Smalltalk ui icons smallSystemBrowserIcon;
		action: [ Browser open ]