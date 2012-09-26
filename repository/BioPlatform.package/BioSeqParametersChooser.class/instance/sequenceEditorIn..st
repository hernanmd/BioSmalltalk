user interface
sequenceEditorIn: aMorph

	| statusView |
	statusView := aMorph
				newTextEditorFor: self
				getText: #getDescription
				setText: #setDescription:.
	^ statusView