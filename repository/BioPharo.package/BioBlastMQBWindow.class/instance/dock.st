accessing
dock
	^ dock
		ifNil: [ dock := MQBBlastDockHelper new model: self ]