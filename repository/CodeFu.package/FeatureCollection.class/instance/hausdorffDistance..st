distance
hausdorffDistance: aFeatureCollection
	"Answer the hausdorff distance between myself and aFeatureCollection. 
	Limitations of the implementation see FeatureCollection>>hausdorffMinima:."

	| distance |
	distance := Accumulator maximum.
	distance enumerate: (self hausdorffMinima: aFeatureCollection).
	distance enumerate: (aFeatureCollection hausdorffMinima: self).
	^distance value