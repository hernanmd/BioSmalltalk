accessing private
doesNotUnderstand: aMessage
	" Private - Redirect messages not understood to the GET command.
	This allows to have interchangeable message sends to the NCBI Client
	without having to specify put or get start/end modes "
	
	^ aMessage sendTo: self get