specs
defaultSpec
	<spec>
	
	^ SpecLayout composed
		newColumn: [ : col |
			col 
				newRow: #selector;
				newRow: #toolbar height: self toolbarHeight ];
		yourself
