converting
derive: aBlock 

	| derivate |
	derivate := SmartMapping new.
	derivate setParent: self.
	self do: [ :index | (aBlock value: index) ifTrue: [derivate add: index]].
	^derivate