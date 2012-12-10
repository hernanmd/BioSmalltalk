instance creation
item: anItem features: aCollection 

	^((self withAll: aCollection) sorted)
		setItem: anItem;
		yourself