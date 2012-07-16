accessing private
selectNodes: nodesCollection in: anObject

	^ self parserClass 
			tokenizeNcbiXmlEntrezSearchResult: anObject contents 
			nodes: nodesCollection