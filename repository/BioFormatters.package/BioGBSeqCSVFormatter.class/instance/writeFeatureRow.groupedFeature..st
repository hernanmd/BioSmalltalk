accessing
writeFeatureRow: dict groupedFeature: ttyName 

	self features do: [: key |
		key = 'Recognized Region' 
			ifTrue: [ 
				stream 
					nextPutAll: ttyName;
					nextPut: self delimiterSourceCharacter. ]
			ifFalse: [ 
				stream 
					nextPutAll: (dict at: key ifAbsent: [ '-' ]);
					nextPut: self delimiterSourceCharacter ] ].
	stream cr