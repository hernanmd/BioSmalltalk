user interface
buildSearchModeToolBar: aWindow

	^ aWindow newToolbar: {
		self buildSearchTextMorph.
		self buildExactMatchChooser }.