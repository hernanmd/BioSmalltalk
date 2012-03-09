downloading
activate
	" See superimplementor's comment "
	
	^ ( self webClient httpGet: self downloadUrl ) contents withSqueakLineEndings