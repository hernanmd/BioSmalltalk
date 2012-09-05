user interface
buildExactMatchChooser

	| string btnHeight btnWidth |
	string := 'Exact Match' translated.
	btnHeight := StandardFonts buttonFont height + 8.
	btnWidth := 0.
	string do: [:c | btnWidth := btnWidth + (StandardFonts buttonFont widthOf: c)].
	^ ( CheckboxMorph 
			on: self
			selected: #useExactMatch
			changeSelected: #useExactMatch: )
			beCheckbox;
			vResizing: #rigid;
			height: btnHeight;
			width: btnWidth + 30;
			label: string