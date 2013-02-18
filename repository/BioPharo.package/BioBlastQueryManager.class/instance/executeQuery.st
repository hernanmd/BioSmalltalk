accessing
executeQuery
	" Private - Validate and execute the receiver's query "

	| selectedNodes |
	
	(self canExecute and: [ (selectedNodes := self openOutputSelectorWindow) isEmpty not ])
		ifTrue: [ 
			self execute.
			self parseSelections: selectedNodes ]