comparing
hash
	"hash is implemented because #= is implemented"

	^ self species hash bitXor: [ self name hash ]