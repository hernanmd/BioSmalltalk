evaluating
value
	" Answer the receiver's value. If no value was set
	then use the receiver's default value "

	^ value
		ifNil: [ value := self defaultValue ]