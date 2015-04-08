accessing
groupNameQualifier
	" Answer a <String>. The group name qualifier is a property used to group the receiver's aligned records "

	^ groupNameQualifier
		ifNil: [ groupNameQualifier := 'breed' ]