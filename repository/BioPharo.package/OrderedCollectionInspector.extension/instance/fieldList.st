*biopharo
fieldList
	object ifNil: [ ^ OrderedCollection new].

	"Guard against incomplete object. You can not ask its size."
	[ object instVarAt: 3 ]
	on: SubscriptOutOfBounds 
	do: [ : ex | ^ self instVarFieldList ].
	
	(object instVarAt: 3) "lastIndex"
		ifNil: [ ^ self baseFieldList ].
		
	^ self instVarFieldList
"
OrderedCollection new inspect
(OrderedCollection newFrom: #(3 5 7 123)) inspect
(OrderedCollection newFrom: (1 to: 1000)) inspect
"