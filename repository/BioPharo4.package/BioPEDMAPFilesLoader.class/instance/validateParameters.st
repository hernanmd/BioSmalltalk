private
validateParameters

	self populationNameTextEdit pendingText
		ifEmpty: [ self informMessage: 'Population name cannot be empty'.
			^ false ].
	self textFieldForPed pendingText 
		ifEmpty: [ self informMessage: 'PED file must be selected'.
			^ false ].
	self textFieldForMap pendingText 
		ifEmpty: [ self informMessage: 'MAP file must be selected'.
			^ false ].
	^ true
		