user interface
openDistributionMap

	| squares parts view |
	squares := OrderedCollection new.
	self topics do: [ :topic |	topic documents do: [ :document |	squares add: document item -> topic ]].
	parts := (squares groupedBy: [ :each | each key belongsTo ]) associations.

	view := Pimon.RectangleFigure new.
	view opaque.
	view addAll: parts do: [ :part |
		"part item is NameSpace -> Collection"
		part addAll: part item value do: [ :square |
			"quare item is Document -> Topic"
			square blend: square item value color ].
		part sort: #value.
		part goldenRatioFlowLayout.
		part item: part item key ].
	view flowLayout: 10 width: 600.	
	view open.

	"view := Mondrian.ViewRenderer new.
	view box: [
		view nodes: parts using: Mondrian.DMRectangle new forEach: [ :each |
			view nodes: each value using: Mondrian.DMSquare new 
		]
	].
	view open"