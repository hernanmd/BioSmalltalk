settings
serializerClientOn: aBuilder
	<bioPharoSettings>

	(aBuilder pickOne: #adapterClass)
		target: BioSerializationEngine;
		getSelector: #isPreferred;
		setSelector: #bePreferred:;
		label: 'Serialization client' translated;
		description: 'Set the serialization client package to be used' translated;
		parent: #bio;
		domainValues: BioSerializationEngine validAdapters