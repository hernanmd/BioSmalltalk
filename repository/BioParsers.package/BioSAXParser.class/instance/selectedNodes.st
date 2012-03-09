accessing
selectedNodes
	"Answer the value of choosenNodes"

	^ selectedNodes
		ifNil: [ selectedNodes := self defaultNodes asOrderedCollection ]