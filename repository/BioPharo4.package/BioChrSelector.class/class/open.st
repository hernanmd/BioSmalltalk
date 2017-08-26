opening
open
	" Display the receiver "

	| newSelector |
	
	newSelector := self new.
	newSelector
		openWithSpec;
		centered.
	newSelector window modalRelativeTo: World.
	newSelector window whenClosedDo: [ ^ newSelector chrList selectedItem ].
	^ newSelector.