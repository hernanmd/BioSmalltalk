testing
testMarkerNumbers

	| newMarkers |
	
	self assert: (self haploBlock1 markerNumbers isKindOf: Collection).
	self assert: (self haploBlock1 markerNumbers allSatisfy: #isNumber).
	
	newMarkers := #(1 2 3 4).
	self haploBlock1 markerNumbers: newMarkers.
	self assert: (self haploBlock1 markerNumbers hasEqualElements: newMarkers).
	