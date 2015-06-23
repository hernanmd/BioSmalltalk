*BioSupport
associationsDo: aBlock displayingProgress: aStringOrBlock every: msecs

	| size labelBlock count oldLabel lastUpdate |
	self isEmpty ifTrue: [ ^ self ].
	oldLabel := nil.
	count := lastUpdate := 0.
	size := self size.
	'' displayProgressFrom: 0 to: size during: [:bar |
		labelBlock := aStringOrBlock isString
			ifTrue: [
				bar label: aStringOrBlock.
				[ :dummyItem | aStringOrBlock]]
			ifFalse: [aStringOrBlock].
		array do: [ : each| | newLabel |
				"Special handling for first and last element"
			(count = 0 or: [count+1 = size or: [(Time millisecondsSince: lastUpdate) >= msecs]]) 
				ifTrue: [ 
					bar current: count.
					oldLabel = (newLabel := (labelBlock cull: each) ifNil: [oldLabel]) 
						ifFalse: [ bar label: newLabel.	
							ProgressNotification signal: '' extra: (oldLabel := newLabel)	].
					lastUpdate := Time millisecondClockValue ].
			each ifNotNil: [aBlock value: each].
                      	 count := count + 1]].