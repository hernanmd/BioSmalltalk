initialize-release
initializeRows: m columns: n

	columns := Array new: n.
	1 to: n do: [ :index | columns at: index put: (self vectorSpecies new: m) ].