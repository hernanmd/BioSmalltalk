private
validateParameters

	self populationNameTextEdit pendingText
		ifEmpty: [ self inform: 'Population name cannot be empty'.
			^ false ].
	self textFieldForPed pendingText 
		ifEmpty: [ self inform: 'PED file must be selected'.
			^ false ].
	self textFieldForMap pendingText 
		ifEmpty: [ self inform: 'MAP file must be selected'.
			^ false ].
	^ true
		