private-algorithm
step2
	"comment stating purpose of message"

	#(#(#iveness #ive) #(#fulness #ful) #(#ousness #ous) #(#ization #ize) #(#ational #ate) #(#tional #tion) #(#biliti #ble) #(#ation #ate) #(#alism #al) #(#aliti #al) #(#iviti #ive) #(#ousli #ous) #(#entli #ent) #(#ator #ate) #(#enci #ence) #(#anci #ance) #(#logi #log) #(#izer #ize) #(#bli #ble) #(#alli #al) #(#eli #e)) 
		do: 
			[:rule | 
			(self endsWith: (rule at: 1)) 
				ifTrue: 
					[cursor >= r1 ifTrue: [self setSuffix: (rule at: 2)].
					^nil]]