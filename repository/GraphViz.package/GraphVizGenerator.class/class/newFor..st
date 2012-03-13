as yet unclassified
newFor: aGraphViz

	| generator |
	generator := self new.
	generator graph: aGraphViz.
	
	^ generator