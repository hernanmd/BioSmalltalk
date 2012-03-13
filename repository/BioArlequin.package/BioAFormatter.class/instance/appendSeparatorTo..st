accessing
appendSeparatorTo: stream

	| separator |

	separator := self outputFile profileSection locusSeparator.
	separator = 'TAB'
		ifTrue: [ stream tab ]
		ifFalse: [ 
			separator = 'WHITESPACE'
				ifTrue: [ stream space ]
				ifFalse: [ 
					separator = 'NONE'
						ifFalse: [ stream nextPutAll: separator ] 							
				] 
		].