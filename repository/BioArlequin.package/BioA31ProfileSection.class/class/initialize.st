class initialization
initialize
	" self initialize "
	
	ArlequinDataTypes := Array with: 'DNA' with: 'RFLP' with: 'MICROSAT' with: 'STANDARD' with: 'FREQUENCY'. 
	ArlequinFrequencies := Array with: 'ABS' with: 'REL'.
	ArlequinLocusSeparators := self formatter separators
