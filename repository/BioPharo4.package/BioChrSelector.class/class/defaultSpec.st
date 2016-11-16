spec
defaultSpec
	<spec>
	
	^ SpecLayout composed
		newColumn: [ : col |
			col 
				newRow: [ : row |
					row
						newColumn: #organismList width: 200;
						addVSplitter;				
						newColumn: #chrList ];
				newRow: #toolbar height: self toolbarHeight ];
		yourself
