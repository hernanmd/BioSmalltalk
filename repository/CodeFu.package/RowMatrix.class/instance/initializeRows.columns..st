initialize-release
initializeRows: m columns: n

	rows := Array new: m.
	1 to: m do: [ :index | rows at: index put: (self vectorSpecies new: n) ].