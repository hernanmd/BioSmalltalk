user interface
buildSearchTextMorph

	^ ( EditableDropListMorph
		on: self
		list: Array empty
		selected: nil
		changeSelected: nil ) 
			addToListSel: #searchCallback:;
			hResizing: #spaceFill; 
			ghostText: 'Hit return to accept' translated.
