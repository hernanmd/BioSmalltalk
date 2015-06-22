settings
webClientOn: aBuilder
	<bioPharoSettings>

	(aBuilder pickOne: #adapterClass)
		target: BioWebClientEngine;
		getSelector: #isPreferred;
		setSelector: #bePreferred:;
		label: 'Web client' translated;
		description: 'Set the web client package to be used' translated;
		parent: #bio;
		domainValues: BioWebClientEngine validAdapters