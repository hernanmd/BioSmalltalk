private
hausdorffMinima: aFeatureCollection
	"Answer for each element in myself the distance to the nearest element in aFeatureCollection.
	Assumes that the elements of both collections are sorted using an ordering that is compatible
	with the distance metric defined between these elements. Thus this implementation works fine
	with any arithemtic values, except points and complex numbers."

	| minima current stream |
	stream := aFeatureCollection readStream.
	current := stream next.
	minima := self collect: [ :a |
		[ stream atEnd not and: [ (current dist: a) >= (stream peek dist: a) ] ] whileTrue: [ current := stream next ].
		(current dist: a)
	].
	^minima