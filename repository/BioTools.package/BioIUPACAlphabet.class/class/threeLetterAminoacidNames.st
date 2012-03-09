accessing
threeLetterAminoacidNames

	^ ThreeLetterAminoacidNames
		ifNil: [ self initialize.
				ThreeLetterAminoacidNames ]	