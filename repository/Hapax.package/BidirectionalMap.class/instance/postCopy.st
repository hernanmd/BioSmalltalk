copying
postCopy
	"Make sure to copy the contents fully."

	super postCopy.
	forwards := forwards copy.
	backwards := backwards copy.