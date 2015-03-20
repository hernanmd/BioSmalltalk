accessing
parser: aParser
	" Set aParser to each of the receiver's elements "
	self do: [ : eachReader | eachReader parser: aParser ]