private
addPEDMAPFiles
	" Private - Add all receiver's phased files to workflow manager "
	
	self validateParameters
		ifFalse: [ ^ self ].
	self actionBlock isNil 
		ifTrue: [ ^ self pedFile -> self mapFile ]
		ifFalse: [ self actionBlock value: self pedFile value: self mapFile ].
"		addPopulationName: self populationNameTextEdit pendingText;
		addInputFile: self pedFile , self populationNameTextEdit pendingText;
		addInputFile: self mapFile , self populationNameTextEdit pendingText.
"	self informUser.

