private-algorithm
step1a
	"comment stating purpose of message"

	(string last == $s) ifTrue: [
		(self endsWith: #sses) ifTrue: [ string := string copyFrom: 1 to: string size - 2 ] ifFalse: [ 
			(self endsWith: #ies) ifTrue: [ string := string copyFrom: 1 to: string size - 2 ]	ifFalse: [ 
				(self endsWith: #ss) ifFalse: [ string := string copyFrom: 1 to: string size - 1 ]]]]

	"#(#(#sses #ss) #(#ies #i) #(#ss #ss) #(#s #'')) do: 
			[:rule | 
			(self endsWith: rule first) 
				ifTrue: 
					[self setSuffix: rule last.
					^nil]]"