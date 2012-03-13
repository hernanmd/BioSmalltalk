converting
createMorph
	"builds and returns a morph"

	^ (PNGReadWriter createAFormFrom: (self generateType: #png)) first asMorph
