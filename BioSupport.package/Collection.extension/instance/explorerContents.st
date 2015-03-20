*BioSupport
explorerContents

	| digits |
	
	digits := self size digitCount.
	^ self explorerContentsWithIndexCollect: [:value :index |
		| zeroPadding repeats |
		
		zeroPadding := [ BioObject generateJoin: 0 repeat: digits - index digitCount ]
		on: MessageNotUnderstood 
		do: [: ex | String empty ].
		ObjectExplorerWrapper
			with: value
			name: zeroPadding , index asString
			model: self]