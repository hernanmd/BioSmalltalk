accessing
endElement: elementName

	( ( super endElement: elementName ) and: [ self eRecord isEmpty not ] )
		ifTrue: [ self results add: self eRecord. ]
