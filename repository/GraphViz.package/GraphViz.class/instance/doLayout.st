layout
doLayout

	| layout graphHeight graphWidth |
	layout := self asLayoutCoordinates.
	
	graphWidth := (layout first third asNumber * self class pointsPerInch) asNumber rounded.
	graphHeight := (layout first fourth asNumber * self class pointsPerInch) asNumber rounded.
	
	extent :=  graphWidth @ graphHeight.
	
	self layoutNodes: (layout select: [:each | each first = #node]).
	self layoutEdges: (layout select: [:each | each first = #edge]).