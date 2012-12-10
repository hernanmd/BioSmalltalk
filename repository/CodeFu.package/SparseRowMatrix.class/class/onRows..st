private
onRows: rowCollection

	| new |
	new := self basicNew.
	new instVarNamed: 'rows' put: rowCollection asArray.
	[ new checkInvariant ] assert.
	^new