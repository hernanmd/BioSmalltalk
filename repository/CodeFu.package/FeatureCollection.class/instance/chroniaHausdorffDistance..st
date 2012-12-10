distance
chroniaHausdorffDistance: aFeatureCollection
	"Answer a modified hausdorff distance between myself and aFeatureCollection. 
	Further information see 'How Developers Drive Software Evolution' (to be published at IWPSE 2005).
	Limitations of the implementation see FeatureCollection>>hausdorffMinima:."

	| distance |
	distance := Accumulator squaredSum.
	distance enumerate: (self hausdorffMinima: aFeatureCollection).
	distance enumerate: (aFeatureCollection hausdorffMinima: self).
	^distance value