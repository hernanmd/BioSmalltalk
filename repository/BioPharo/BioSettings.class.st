Class {
	#name : #BioSettings,
	#superclass : #SettingTreeBuilder,
	#category : 'BioPharo-Platform'
}

{ #category : #acessing }
BioSettings class >> gtSettingsOn: aBuilder [
	<bioPharoSettings>

	(aBuilder group: #gt)
		label: 'BioSmalltalk Settings' translated;
		description: 'Settings related to BioSmalltalk';
		with: [
			self webClientOn: aBuilder.
			self serializerClientOn: aBuilder ]

]

{ #category : #private }
BioSettings class >> serializerClientOn: aBuilder [
	"<systemsettings>"

	( aBuilder pickOne: #adapterClass )
		target: BioSerializationEngine;
		label: 'Serialization client' translated;
		description: 'Set the serialization client package to be used' translated;
		parent: #gt;
		domainValues: BioSerializationEngine validAdapters
]

{ #category : #private }
BioSettings class >> webClientOn: aBuilder [
	"<systemsettings>"

	( aBuilder pickOne: #adapterClass )
		target: BioWebClientEngine;
		label: 'Web client' translated;
		description: 'Set the web client package to be used' translated;
		parent: #gt;
		domainValues: BioWebClientEngine validAdapters
]
