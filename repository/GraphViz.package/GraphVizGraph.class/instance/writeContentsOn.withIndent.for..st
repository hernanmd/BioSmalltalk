streaming
writeContentsOn: stream withIndent: aNumber for: graph

	children do: [:each | each writeOn: stream withIndent: aNumber + 1 for: self].
