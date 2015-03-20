accessing
values: aNodeName
	" Answer a Collection of receiver's align lengths nodes in each HSP node "
	
	| answer |
	
	answer := self nodes select: [ : node | node nodeName = aNodeName ].
	answer isEmpty
		ifTrue: [ answer := self nodes do: [: node | node values: aNodeName ] ].
	^ answer collect: #value.	