private-algorithm
toLowercase
	"Converts the current string to lowercase (reimplemented here for performance reasons)."

	| copy |
	copy := string copy.
	1 to: string size do: [ :index | 
		| code |
		code := (string at: index) asInteger.
		(65 <= code and: [code <= 90]) ifTrue: [ copy at: index put: (Character value: code + 32) ]].
	string := copy