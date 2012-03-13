converting
asLayoutCoordinates
	"Create graph layout cooordinates in a format that could be easily parsed in Squeak."

	| lines layout |
	lines := OrderedCollection new.
	layout := (self asOutputType: 'plain-ext') copyReplaceAll: String lf with: String cr.
	
	layout linesDo: [:each | lines add: (self tokenizeLine: each)].
	
	^ lines
