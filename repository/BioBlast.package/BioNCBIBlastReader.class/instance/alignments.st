accessing-blast
alignments
	" Answer a Collection of receiver's alignment (for the database) in each receiver's HSP node "
	
	| align parsedOrFilteredResults |
	
	align := BioAlignment new.
	" Iterate over the receiver's filtered contents if appropriate "
	parsedOrFilteredResults := self contents result.
	parsedOrFilteredResults collect: [: eachHit | 
		| theHsp |
		theHsp := eachHit hitHsps nodes anyOne.
		align addSequence: ( 
			BioSequence 
				newNamed: eachHit hitAccessions 
				sequence: theHsp hspHSeq blastValue ) ].
	^ align