as yet unclassified
isAbstract

	^ [GraphViz defaultGeneratorClass ~= OSProcessGraphVizGenerator]
		on: Warning
		do: [^ true]
