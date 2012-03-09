accessing
hitHspsNodes
	" See superimplementor's comment "
	
	" Added HIT here so the nodes builder can add each hit as container of different hit nodes "
	^ super hitHspsNodes 
				add: ( BioBlastHitNode nodeName -> BioBlastHitNode description );
				yourself