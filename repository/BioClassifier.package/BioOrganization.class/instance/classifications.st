accessing
classifications

	^ matchedElements
		ifNil: [ matchedElements := self matchClass new ]