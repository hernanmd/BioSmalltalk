accessing
isRootIn: aRootNode
	" Answer <true> if receiver's is used as 'top' element in
	the aRootNode nodes. I.e. if the receiver is a 'hit' node and the
	first node in aRootNode's nodes is a 'hit' then add it "
	
	^ (aRootNode first nodeName = self nodeName) or: [ self isStructureNode ]
