accessing-private
buildTokensBlock 

	^ [: node | 
		OrderedCollection
			with: node first
			with: (node second collect: #allButLast) 
			with: (((node third reject: [: line | line first isEmpty ]) collect: #first) collect: #withoutBlanks ) ]