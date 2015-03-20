testing
isPresent
	" Answer <true> if the receiver's is actually installed in the system "
	
	^ (self programNamed: self mainExecName) notNil