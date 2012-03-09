private
isPreferredFor: aString
	" Answer <true> if aString is the most appropriate content for the receiver "
	
	^ aString beginsWith: '<?xml version="1.0" ?>
<!DOCTYPE eSearchResult PUBLIC "-//NLM//DTD eSearchResult'