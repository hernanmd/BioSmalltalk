instance creation
rows: m columns: n withAll: value

	^(self rows: m columns: n) 
		atAllPut: value;
		yourself