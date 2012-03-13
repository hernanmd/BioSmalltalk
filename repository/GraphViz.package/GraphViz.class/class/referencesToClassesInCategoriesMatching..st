samples
referencesToClassesInCategoriesMatching: symbol

	"GraphViz referencesToClassesInCategoriesMatching: 'GraphViz'"
	"GraphViz referencesToClassesInCategoriesMatching: 'System-Archives'"
	"GraphViz referencesToClassesInCategoriesMatching: 'Collections-Weak'"
	"GraphViz referencesToClassesInCategoriesMatching: #DynamicBindings"
			
	| graph edges |
	graph := self new.

	graph
		name: symbol;
		add: #graph with: {#overlap -> #orthoyx. #start -> #rand. #splines -> #true. #bgcolor -> #transparent. #concentrate -> #true};
		add: #node with: {#shape -> #box. #fontsize -> 10. #style -> #filled. #fillcolor -> #tomato. #height -> 0.25};
		add: #edge with: {#arrowtail -> #normal. #arrowsize -> 0.5. #minlen -> 2}.

	edges := Set new.
	(SystemOrganization categoriesMatching: (symbol, '*')) do:
		[:cat |
	
		(SystemOrganization listAtCategoryNamed: cat) do:
			[:klass |
			graph add: klass with: {#fillcolor -> #palegreen}.
			
			(Smalltalk at: klass) allCallsOn do: [:each | edges add: klass -> each classSymbol]]].

		edges do: [:each | graph add: each].

	graph
		add: #graph with: {#label -> symbol. #fontsize -> 20};
		openInWindow