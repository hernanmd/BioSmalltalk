accessing-properties
newProperty: row
	" Answer a new blast property from row contents "

	^ BioBlastProperty new
		displayName: row first;
		explanation: row second;
		name: row third;
		type: row fourth
