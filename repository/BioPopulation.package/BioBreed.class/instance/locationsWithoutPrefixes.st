text-mining
locationsWithoutPrefixes
	" Answer a <Collection> of Strings with receiver's locations without common prefixes "
	
	^ (self locations collect: [: loc | self class removePrefixes: loc ]) flatCollect: [: e | e ]