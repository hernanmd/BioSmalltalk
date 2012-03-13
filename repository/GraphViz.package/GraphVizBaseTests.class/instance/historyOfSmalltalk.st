fixture
historyOfSmalltalk
	"self new historyOfSmalltalk"

	^ GraphViz new
		beDirected;
		name: 'HistoryOfSmalltalk';
		add: #graph with: {#overlap -> #scale. #concentrate -> #true. #ranksep -> 0.25};
		add: #edge with: {#arrowsize -> 0.5};
		
		add: #node with: {#shape -> #plaintext. #fontsize -> 16};
		add: #past ->  '1970s' -> 1980 -> 1983 -> 1985 -> 1991 -> 1993 -> 1995 -> 1996 -> 1998 -> 1999 -> 2000;
		
		add: #node with: {#shape -> #box. #fontsize -> 10. #style -> #filled. #fillcolor -> #ivory. #height -> 0.25};
	
		rank: #past add: #(CDL Simula Lisp);
		rank: '1970s' add: #('Smalltalk-71' 'Smalltalk-72, 74, 76, 78');
		rank: 1980 add: 'Smalltalk-80';
		rank: 1983 add: 'Objective-C';
		rank: 1985 add: #Self;
		rank: 1991 add: #Oak;
		rank: 1993 add: #Ruby;
		rank: 1995 add: 'Java 1';
		rank: 1996 add: #Squeak;
		rank: 1998 add: 'Java 2';
		rank: 1999 add: #VisualWorks;
		rank: 2000 add: 'C#';
		
		add: #Simula -> 'Smalltalk-71';
		add: #CDL -> 'Smalltalk-71';
		add: #Lisp -> 'Smalltalk-71' -> 'Smalltalk-72, 74, 76, 78' -> 'Smalltalk-80' -> 'Objective-C' -> #Oak;
		add: 'Smalltalk-80' -> #Self;
		add: 'Smalltalk-80' -> #Oak -> 'Java 1' -> 'Java 2' ->  'C#';
		add: 'Smalltalk-80' -> #Ruby;
		add: 'Smalltalk-80' -> #Squeak;
		add: 'Smalltalk-80' -> #VisualWorks;
		
		yourself