private
serializerClientOn: aBuilder
	"<systemsettings>"

	( aBuilder pickOne: #adapterClass )
		target: BioSerializationEngine;
		label: 'Serialization client' translated;
		description: 'Set the serialization client package to be used' translated;
		parent: #gt;
		domainValues: BioSerializationEngine validAdapters