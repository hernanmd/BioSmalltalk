accessing
webClientOn: aBuilder
	"<systemsettings>"

	(aBuilder pickOne: #adapterClass)
		target: BioWebClientEngine;
		label: 'Web client' translated;
		description: 'Set the web client package to be used' translated;
		parent: #bio;
		domainValues: BioWebClientEngine validAdapters