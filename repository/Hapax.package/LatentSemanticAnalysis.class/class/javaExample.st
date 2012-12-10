instance creation
javaExample

	^self 
		fromFolder: 'C:\Documents and Settings\akuhn\Desktop\workspace\MSE for Java\src' 
		select: [ :file | file tail endsWith: '.java' ]