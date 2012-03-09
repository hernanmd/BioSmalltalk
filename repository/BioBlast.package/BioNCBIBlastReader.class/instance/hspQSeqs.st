accessing-blast-items
hspQSeqs
	" Answer a Collection of receiver's alignment strings (for the query, this is the originally sent by the Blast user) "
	
	| bioSearchResult |

	bioSearchResult := self contents.
	^ bioSearchResult contents collect: [: node | node selectHspQSeq ]