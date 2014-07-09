accessing
bePreferred: aClass
	" Set aClass as preferred adapter to use "

	aClass notNil ifTrue: [ 
		isPreferred := aClass ]