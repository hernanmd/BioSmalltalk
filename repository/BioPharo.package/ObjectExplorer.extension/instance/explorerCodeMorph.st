*biopharo
explorerCodeMorph

	^ ( PluggableTextMorph 
			on: self 
			text: #trash 
			accept: #trash:
			readSelection: #contentsSelection 
			menu: #codePaneMenu:shifted:)
				askBeforeDiscardingEdits: false