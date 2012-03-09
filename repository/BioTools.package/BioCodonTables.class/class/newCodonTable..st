initialize-release
newCodonTable: tableSelectors

	| codonTable tableIdSelector tableNames table tableStartCodons tableStopCodons |
	
	tableIdSelector := tableSelectors detect:[ : s | s endsWith: 'Id' ].
	tableNames := tableSelectors detect: [: s | s endsWith: 'TableNames' ].
	table := tableSelectors detect: [: s | s endsWith: 'Table' ].
	tableStartCodons := tableSelectors detect: [: s | s endsWith: 'StartCodons' ].
	tableStopCodons := tableSelectors detect: [: s | s endsWith: 'StopCodons' ].

	codonTable := 
		BioCodonTable new 
				addName: ( self perform: tableIdSelector );
				table: ( self perform: table );
				startCodons: ( self perform: tableStartCodons );
				stopCodons: ( self perform: tableStopCodons ).
		( self perform: tableNames ) do: [: tbName | codonTable addName: tbName ].

	^ codonTable 