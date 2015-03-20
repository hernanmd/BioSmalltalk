accessing
endElement: elementName

	( super endElement: elementName )
		ifTrue: [ self results add: self eRecord. ]