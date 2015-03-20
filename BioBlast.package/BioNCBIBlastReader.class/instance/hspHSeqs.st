accessing-blast-items
hspHSeqs
	" Answer a Collection of receiver's alignment strings (for the database) in each receiver's HSP node "
	
	| bioSearchResult |

	bioSearchResult := self contents.
	^ bioSearchResult contents collect: [: node | node selectHspHSeq ]