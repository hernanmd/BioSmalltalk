accessing nodes
do: aBlock
	" Answer a Collection of receiver's nodes named aNodeName "
	
	self nodes do: [ : node | aBlock value: node  ].
