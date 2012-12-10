private
rearrange: newItems

	| newColumns indices |
	[ items equalsTo: newItems ] assert.
	"create new column vectors."
	newColumns := partialColumns collect: [ :each | each copyEmpty: each size ].
	"get the new order of indices."
	indices := newItems collect: [ :each | items indexOf: each ].
	"map the distances into to the new vectors."
	newColumns doWithIndex: [ :vector :column |
		vector putWithIndex: [ :row | 
			self at: (indices at: column) and: (indices at: row) ]].
	"update state of object and check invariant"
	partialColumns := newColumns.
	items := newItems.
	"items := newItems."
	[ self checkInvariant ] assert.