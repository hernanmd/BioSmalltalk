comparing
= aBioBlastProperty
	"Answer whether the receiver and anObject represent the same object."

	^ self species = aBioBlastProperty species and: [ self name = aBioBlastProperty name ]