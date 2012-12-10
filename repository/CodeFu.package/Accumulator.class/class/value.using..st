instance creation
value: initialValue using: anAccumulationBlock

	^self value: initialValue using: anAccumulationBlock finally: [:value :size | value]