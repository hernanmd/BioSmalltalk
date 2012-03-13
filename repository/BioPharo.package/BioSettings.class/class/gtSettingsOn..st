acessing
gtSettingsOn: aBuilder
	<bioPharoSettings>

	(aBuilder group: #gt)
		label: 'BioSmalltalk Settings' translated;
		description: 'Settings related to BioSmalltalk';
		with: [
			self webClientOn: aBuilder.
			self serializerClientOn: aBuilder ]
