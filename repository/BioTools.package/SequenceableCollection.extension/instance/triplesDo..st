*BioTools
triplesDo:aBlock
    " Assume receiver with 3-element triples. The block is called with 3 arguments for each collection in the receiver."

    self do: [: triple |
        aBlock 
		value: (triple at:1) 
		value: (triple at:2) 
		value: (triple at:3)]