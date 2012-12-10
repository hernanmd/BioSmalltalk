private
swap: i with: j 

	| t |
	t := self collectionAt: i.
	self collectionAt: i put: (self collectionAt: j).
	self collectionAt: j put: t