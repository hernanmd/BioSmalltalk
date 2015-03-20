accessing
currentCodonTable

	^ CurrentCodonTable
		ifNil: [ CurrentCodonTable := self defaultCodonTable ]