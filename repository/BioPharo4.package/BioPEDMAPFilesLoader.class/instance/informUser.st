private
informUser

	(self confirm: 'PED and MAP files added. Do you want to load additional populations?')
		ifFalse: [ self delete ]
		ifTrue: [ 
			self problemPopulationCheck state: false.
			self textFieldForPed clearText.
			self textFieldForMap clearText.
			self populationNameTextEdit clearText  ]

