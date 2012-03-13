accessing-output
contents

	^ contents
		ifNil: [ contents := self contentsClass new ]