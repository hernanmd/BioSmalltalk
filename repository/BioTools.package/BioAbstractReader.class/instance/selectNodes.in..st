accessing parser
selectNodes: nodesCollection in: anObject

	^ self parserClass 
			tokenizeNcbiXmlBlast: anObject contents 
			nodes: nodesCollection


	