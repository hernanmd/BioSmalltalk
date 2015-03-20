utilities
invalidCharacters
	" Answer a Collection with Characters without visible
	or invalid (i.e. used for starting comments) representation "

	^ { $# . Character space  . Character tab }