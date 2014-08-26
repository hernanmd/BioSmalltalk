accessing hsps
hspsDo: aBlock

	self hspsNodes do: [: node | aBlock value: node ]