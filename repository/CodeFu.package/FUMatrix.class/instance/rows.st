accessing vectorwise
rows

	| array |
	array := Array new: self rowSize.
	1 to: self rowSize do: [ :index | array at: index put: (self rowAt: index) ].
	^array