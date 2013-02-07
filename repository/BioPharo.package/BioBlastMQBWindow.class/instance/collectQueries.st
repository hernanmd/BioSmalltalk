private
collectQueries
	" Private - Walk over the receiver's panes to retrieve query information "

	self searchBoxMorphs triplesDo: [: prop : op : value | 
		| fieldValues |
		fieldValues := (Array with: prop with: op with: value) collect: #selectedItem.
		fieldValues third isNil
			ifTrue: [ fieldValues at: 3 put: value contentMorph getText ].
		(self validateFields: fieldValues)
			ifTrue: [ self queryManager addNewQuery: fieldValues ]
			ifFalse: [ 
				self queryManager disableExecution.
				self inform: 'Some or all query values are missing' translated ]].