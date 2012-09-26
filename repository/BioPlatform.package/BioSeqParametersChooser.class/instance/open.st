user interface
open

	Cursor wait
		showWhile: [
			| window |
			window := StandardWindow new model: self.
			self buildWindowIn: window.			
			window title: self windowTitle.
			window openInWorld. ]
