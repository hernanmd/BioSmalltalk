accessing-blast
identities
	" Answer a <Collection> of Strings each one representing the identity (matching residues) in the receiver "
	
	^ self filters isEmpty
		ifTrue: [ 
			( self
				selectNodes: 	#('Hsp_identity')
				in: self results ) at: 'Hsp_identity' ]
		ifFalse: [
			self lastFilter hspIdentities ]