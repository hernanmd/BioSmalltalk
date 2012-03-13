as yet unclassified
testModelWithStyle

	graph add: #node with: #color -> #blue.		
	self should: [graph nodes isEmpty].
	
	self should: [graph styles size =1].