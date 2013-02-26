building
buildOpenQuerySource: fileMenu

	fileMenu
		addToggle: 'Open BLAST XML' translated
		target: self model
		selector: #openFile.
	fileMenu lastItem
		font: window theme menuFont;
		icon: window theme smallOpenIcon;
		keyText: 'Ctrl+O'.