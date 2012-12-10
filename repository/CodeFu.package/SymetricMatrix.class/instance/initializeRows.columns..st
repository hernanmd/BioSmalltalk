initialize-release
initializeRows: m columns: n

	m = n ifFalse: [ Array new noMatchError ].
	partialColumns := Array new: n.
	1 to: n do: [ :index | partialColumns at: index put: (self vectorSpecies new: index) ].