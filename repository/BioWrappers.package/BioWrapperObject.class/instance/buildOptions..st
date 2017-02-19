accessing - private
buildOptions: stream

	self options do: [: optString |
		stream space.	
		optString first = $-
			ifFalse: [ 
				optString size = 1
					ifTrue: [ stream nextPut: $- ]
					ifFalse: [ stream nextPutAll: '--' ]].
		stream nextPutAll: optString ]