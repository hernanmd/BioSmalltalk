accessing vectorwise
columns

	| array |
	array := Array new: self columnSize.
	1 to: self columnSize do: [ :index | array at: index put: (self columnAt: index) ].
	^array