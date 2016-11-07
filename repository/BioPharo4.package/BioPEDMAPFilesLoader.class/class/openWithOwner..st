opening
openWithOwner: anObject

	^ self new
		owner: anObject;
		openWithSpec;
		extent: 350 @ 650