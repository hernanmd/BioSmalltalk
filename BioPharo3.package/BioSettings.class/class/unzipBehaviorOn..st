settings
unzipBehaviorOn: aBuilder
	<bioPharoSettings>

	(aBuilder pickOne: #adapterClass)
		target: self;
		getSelector: #fileExistsBehavior;
		setSelector: #fileExistsBehavior:;
		label: 'Unzip behavior' translated;
		description: 'Set the behavior when unzip files' translated;
		parent: #bio;
		domainValues: self fileExistsBehaviors