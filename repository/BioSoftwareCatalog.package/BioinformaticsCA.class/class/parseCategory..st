private
parseCategory: aString 
	" 
	#('category_id:89812' 'category_name:Bio-* Programming Tools' 'category_path:Computer Related > Bio-* Programming Tools' 'category_id:89795' 'category_name:PHP' 'category_path:Computer Related > PHP')
	"

	^ aString notNil
		ifTrue: [ ((aString findTokens: ';') last findTokens: ':') last ]
		ifFalse: [ String empty ]
