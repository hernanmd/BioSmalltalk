accessing
buildTokensFromFirstBlock: aCollection

	^ aCollection second collect: [: seq | seq second withoutBlanks ]