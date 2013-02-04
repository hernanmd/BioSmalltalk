accessing
newProperty: row
	" Answer a new blast property from row contents "

	^ MQBProperty new
		displayName: row first;
		explanation: row second;
		name: row third;
		type: row fourth
