accessing - sequence annotations
removeAnnotationsAt: key
	" Remove key from the receiver. If key is not in the receiver, notify an error."

	^ self annotations removeKey: key