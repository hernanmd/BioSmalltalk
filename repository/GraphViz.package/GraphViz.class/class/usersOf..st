samples
usersOf: aSymbol

	"GraphViz usersOf: #WeakRegistry"
	"GraphViz usersOf: #Bag"
	| graph  |
	graph := self new.

	graph
		name: (#usersOf, aSymbol) capitalized;
		add: #graph with: {#overlap -> #orthoyx. #start -> #rand. #splines -> #true};
		add: #node with: {#fontsize -> 10. #height -> 0.25. #shape -> #octagon. #style -> #filled. #fillcolor -> #khaki};
		add: aSymbol with: {#fillcolor -> #palegreen};
		add: #edge with: {#len -> 0.75}.
		
	(Smalltalk at: aSymbol) allCallsOn do: 
		[:each |
		graph add: (each classSymbol, '>>', each methodSymbol) with: #label -> (each classSymbol, '>>\n', each methodSymbol).
		graph 
			add: aSymbol -> (each classSymbol, '>>', each methodSymbol)
			with: {#arrowtail -> #normal. #arrowsize -> 0.5}].

	graph
		add: #graph with: {#label -> ('Users of ', aSymbol). #fontsize -> 20};
		
		openInWindow