as yet unclassified
testGraphToXml

	graph add: #A.
	graph add: #B -> #C.
	
	self 
		should: [Smalltalk includesKey: #XMLDOMParser]
		description: 'Need YAXO package to run this test and use asXml feature of graphs'.
	self should: [graph asXml topElement localName = #gxl]