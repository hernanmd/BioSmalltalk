accesing public - protein synthesis
aminoacidNames
	" Answer a <String> with receiver's letters as aminoacid names "

	| aminoacidNames |
	
	aminoacidNames := OrderedCollection new: self size.
	self sequence do: [ : seqLetter |
		aminoacidNames add: seqLetter asAminoacidName ].
	^ aminoacidNames