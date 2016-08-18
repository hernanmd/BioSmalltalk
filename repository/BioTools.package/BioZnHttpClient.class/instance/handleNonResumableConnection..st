private
handleNonResumableConnection: anException

	| msg |
	msg :=  'We got a non-resumable exception while connecting to ' , self url host asString , '. Re-try switching ZdcSocketStream to SocketStream?'.
	self bioLog: msg.
	(self confirm: msg)
		ifTrue: [ 
			ZnNetworkingUtils default socketStreamClass: SocketStream.
			anException retry.]	
	