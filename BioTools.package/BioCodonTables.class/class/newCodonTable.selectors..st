initialize-release
newCodonTable: tableClass selectors: tableSelectors
	" Private - Create a new codon table with the information in tableSelectors "
	| codonTable tableIdSelector tableNames table tableStartCodons tableStopCodons |
	
	tableIdSelector 	:= tableSelectors detect: [ : s | s endsWith: 'Id' ].
	tableNames 		:= tableSelectors detect: [ : s | s endsWith: 'TableNames' ].
	table 				:= tableSelectors detect: [ : s | s endsWith: 'Table' ].
	tableStartCodons 	:= tableSelectors detect: [ : s | s endsWith: 'StartCodons' ].
	tableStopCodons 	:= tableSelectors detect: [ : s | s endsWith: 'StopCodons' ].
	codonTable := BioCodonTable new 
				addName: (tableClass perform: tableIdSelector);
				table: (tableClass perform: table);
				startCodons: (tableClass perform: tableStartCodons);
				stopCodons: (tableClass perform: tableStopCodons);
				yourself.
	(tableClass perform: tableNames) do: [ : tbName | codonTable addName: tbName ].
	^ codonTable 