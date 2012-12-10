accessing
atAllPut: object

	self class switch: object
		caseMatrix: [
			self with: object affect: [ :a :b | b ].
		]
		caseNestedCollection: [
			object size = self rowSize 
				ifTrue: [ 
					[ object first size = self columnSize ] assert. 
					self putWithIndices: [ :row :column | (object at: row) at: column	] 
				] 
				ifFalse: [ object size = self columnSize 
					ifTrue: [ 
						[ object first size = self rowSize ] assert. 
						self putWithIndices: [ :row :column | (object at: column) at: row ] 
					]
					ifFalse: [ Error raise ]
				]
		]
		caseCollection: [	
			| stream |
			[ object size = (self rowSize * self columnSize) ] assert.
			stream := ReadStream on: object.
			self withIndices: [ :row :column |
				self at: row and: column put: stream next
			].
		]
		default: [
			self withIndices: [ :row :column |
				self at: row and: column put: object
			].
		].
	^object.