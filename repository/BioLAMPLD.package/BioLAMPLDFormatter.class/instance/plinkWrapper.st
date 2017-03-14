accessing
plinkWrapper
	" Answer a <BioPLINKWrapper> used to configure plink options to the receiver "

	^ plinkWrapper
		ifNil: [ plinkWrapper := BioPLINK2Wrapper new ]