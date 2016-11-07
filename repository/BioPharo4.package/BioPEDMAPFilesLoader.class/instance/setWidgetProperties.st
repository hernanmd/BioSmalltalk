initialization
setWidgetProperties

	self populationNameTextEdit 
		label: 'Population';
		ghostText: 'Enter population name'.

	self textFieldForPed 
		label: '.PED File';
		fileExtension: 'ped';
		textFieldWidth: self textFieldWidth;
		whenTextChanged: [ : fileName | self pedFile: fileName ].
		
	self textFieldForMap 
		label: '.MAP File';
		fileExtension: 'map';
		textFieldWidth: self textFieldWidth;
		whenTextChanged: [ : fileName | self mapFile: fileName ].
				
	self toolbar
		firstButtonLabel: 'Help';
		secondButtonLabel: 'Load';
		thirdButtonLabel: 'Close'.