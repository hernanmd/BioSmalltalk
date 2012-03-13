generating
makeAll
	"Generate output files in all known formats."

	self class outputFormats do: [:format | self make: format]
