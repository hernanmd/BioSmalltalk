hsps accessing
hspsDo: aBlock

	self hspsNodes do: [: node | aBlock value: node ]