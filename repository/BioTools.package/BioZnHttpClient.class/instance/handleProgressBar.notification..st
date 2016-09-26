accessing
handleProgressBar: bar notification: ex 

	| progress |

	progress := ex.
	progress isEmpty ifFalse: [ 
		bar current: progress percentage.
		progress total ifNotNil: [ : aTotalNumber |
			bar label: 'Downloading ' ] ].
	progress resume