accessing
exportPositions

	1 to: self samplesCollection anyOne size do: [: index |
		 self stream 
				nextPutAll: index asString;
				space;
				nextPut: $; ].
	self stream cr