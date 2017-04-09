convenience-utilities
generate: repValue repeat: repCount
	" ( self new generate: 2 repeat: 4 ) = #(2 2 2 2) "
	
	^ (Generator on: [ : g | repCount timesRepeat: [ g yield: repValue ] ]) upToEnd