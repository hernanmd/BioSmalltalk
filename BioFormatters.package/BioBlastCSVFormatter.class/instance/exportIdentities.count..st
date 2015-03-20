exporting
exportIdentities: aStream count: anInteger

	anInteger timesRepeat: [ aStream nextPut: $. ].