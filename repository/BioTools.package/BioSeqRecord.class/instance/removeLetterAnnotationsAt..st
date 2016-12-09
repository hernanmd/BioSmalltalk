accessing-sequence
removeLetterAnnotationsAt: key
	" Remove key from the receiver. If key is not in the receiver, notify an error. "

	^ self letterAnnotations removeKey: key