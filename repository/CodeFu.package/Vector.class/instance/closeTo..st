comparing
closeTo: aNumber
	self with: (self coerce: aNumber) do: [:a :b |
		(a closeTo: b) ifFalse: [^ false] ].
	^ true