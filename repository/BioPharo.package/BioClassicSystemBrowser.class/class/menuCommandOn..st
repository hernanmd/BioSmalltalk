menu
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'Browser')
		order: 1; 
		parent: #Bio;
		label: 'Browser (Safe Mode)';
		icon: UITheme current smallSystemBrowserIcon;
		action:[Browser open]