spec
defaultSpec
	<spec>
	
	^ SpecLayout composed
		newRow: [ : c | 
				c 
					newColumn: [ : r | r 
						add: #populationNameTextEdit 	height: self toolbarHeight;
						add: #textFieldForPed				height: self toolbarHeight;
						add: #textFieldForMap				height: self toolbarHeight;
						add: #toolbar						height: self toolbarHeight
					] 
		].