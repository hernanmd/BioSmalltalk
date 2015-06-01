initialize-release
initializeWith: aBioA31GroupBuilder

	frequencies := OrderedCollection new.
	sequences := OrderedCollection new.
	identifiers := OrderedCollection new.
	prvIdentifiers := Dictionary new.
	"self samplesPrefix: '_' , ((SmallInteger maxVal atRandom greaseString) first: 3)."
	groupBuilder := aBioA31GroupBuilder.

