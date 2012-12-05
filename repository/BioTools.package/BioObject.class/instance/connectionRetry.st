connect
connectionRetry 
	" Private - Ask for retrying attempt "
	
	^ UIManager default 
			chooseFrom: #('try again' 'give up') 
			title: 'Would you like to try again?' translated