accessing
httpGetContents
	" Answer the String contents in the response from the receiver's current url "
	
	^ [ self httpGet contents ]
	on: MessageNotUnderstood
	do: [ : ex | self httpGet content ]