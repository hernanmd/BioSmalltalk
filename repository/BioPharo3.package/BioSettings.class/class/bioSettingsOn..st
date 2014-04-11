accessing
bioSettingsOn: aBuilder
	<bioPharoSettings>

	(aBuilder group: #bio)
		label: 'BioSmalltalk Settings' translated;
		description: 'Settings related to BioSmalltalk';
		with: [ self webClientOn: aBuilder.
			self serializerClientOn: aBuilder ]
