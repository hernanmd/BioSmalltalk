private
extractIdentifier: breedString

	^ ( breedString withoutBlanks reversed readStream upToAll: ':deerb' ) reversed