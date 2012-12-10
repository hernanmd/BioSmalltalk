converting
deriveWithNames: names

	| derivate |
	derivate := SmartMapping new.
	derivate setParent: self.
	names do: [ :name | derivate add: (self keyForName: name) ].
	^derivate