menu
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'Browser')
		order: 2;
		parent: #Bio;
		label: 'Update BioSmalltalk';
		icon: UITheme current smallUpdateIcon;
		action:[self updateBioSmalltalk]