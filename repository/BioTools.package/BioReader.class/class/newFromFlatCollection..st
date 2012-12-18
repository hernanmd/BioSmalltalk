instance creation
newFromFlatCollection: aCollectionOfFlat
	" Answer a Collection of readers iterating over the Flat Strings at aCollectionOfFlat "

	^ aCollectionOfFlat collect: [: string | self newFromFlat: string ]