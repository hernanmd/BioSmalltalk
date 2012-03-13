accessing
currentPopulationAt: aRegionString
	"Answer the value of currentPopulation"

	^ self populations 
			at: aRegionString
			ifAbsentPut: [ BioPopulation new territory: ( BioTerritory named: aRegionString ) ]