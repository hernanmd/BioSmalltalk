Class {
	#name : #GraphViz,
	#superclass : #GraphVizGraph,
	#instVars : [
		'generator',
		'generatorClass',
		'extent'
	],
	#classInstVars : [
		'colorsByName'
	],
	#category : 'GraphViz'
}

{ #category : #accessing }
GraphViz class >> colors [

	| colorList |
	
	^ colorsByName ifNil: [
	colorList := 
'aliceblue;#f0f8ff
antiquewhite;#faebd7
antiquewhite1;#ffefdb
antiquewhite2;#eedfcc
antiquewhite3;#cdc0b0
antiquewhite4;#8b8378
aquamarine;#7fffd4
aquamarine1;#7fffd4
aquamarine2;#76eec6
aquamarine3;#66cdaa
aquamarine4;#458b74
azure;#f0ffff
azure1;#f0ffff
azure2;#e0eeee
azure3;#c1cdcd
azure4;#838b8b
beige;#f5f5dc
bisque;#ffe4c4
bisque1;#ffe4c4
bisque2;#eed5b7
bisque3;#cdb79e
bisque4;#8b7d6b
black;#000000
blanchedalmond;#ffebcd
blue;#0000ff
blue1;#0000ff
blue2;#0000ee
blue3;#0000cd
blue4;#00008b
blueviolet;#8a2be2
brown;#a52a2a
brown1;#ff4040
brown2;#ee3b3b
brown3;#cd3333
brown4;#8b2323
burlywood;#deb887
burlywood1;#ffd39b
burlywood2;#eec591
burlywood3;#cdaa7d
burlywood4;#8b7355
cadetblue;#5f9ea0
cadetblue1;#98f5ff
cadetblue2;#8ee5ee
cadetblue3;#7ac5cd
cadetblue4;#53868b
chartreuse;#7fff00
chartreuse1;#7fff00
chartreuse2;#76ee00
chartreuse3;#66cd00
chartreuse4;#458b00
chocolate;#d2691e
chocolate1;#ff7f24
chocolate2;#ee7621
chocolate3;#cd661d
chocolate4;#8b4513
coral;#ff7f50
coral1;#ff7256
coral2;#ee6a50
coral3;#cd5b45
coral4;#8b3e2f
cornflowerblue;#6495ed
cornsilk;#fff8dc
cornsilk1;#fff8dc
cornsilk2;#eee8cd
cornsilk3;#cdc8b1
cornsilk4;#8b8878
crimson;#dc143c
cyan;#00ffff
cyan1;#00ffff
cyan2;#00eeee
cyan3;#00cdcd
cyan4;#008b8b
darkgoldenrod;#b8860b
darkgoldenrod1;#ffb90f
darkgoldenrod2;#eead0e
darkgoldenrod3;#cd950c
darkgoldenrod4;#8b6508
darkgreen;#006400
darkkhaki;#bdb76b
darkolivegreen;#556b2f
darkolivegreen1;#caff70
darkolivegreen2;#bcee68
darkolivegreen3;#a2cd5a
darkolivegreen4;#6e8b3d
darkorange;#ff8c00
darkorange1;#ff7f00
darkorange2;#ee7600
darkorange3;#cd6600
darkorange4;#8b4500
darkorchid;#9932cc
darkorchid1;#bf3eff
darkorchid2;#b23aee
darkorchid3;#9a32cd
darkorchid4;#68228b
darksalmon;#e9967a
darkseagreen;#8fbc8f
darkseagreen1;#c1ffc1
darkseagreen2;#b4eeb4
darkseagreen3;#9bcd9b
darkseagreen4;#698b69
darkslateblue;#483d8b
darkslategray;#2f4f4f
darkslategray1;#97ffff
darkslategray2;#8deeee
darkslategray3;#79cdcd
darkslategray4;#528b8b
darkslategrey;#2f4f4f
darkturquoise;#00ced1
darkviolet;#9400d3
deeppink;#ff1493
deeppink1;#ff1493
deeppink2;#ee1289
deeppink3;#cd1076
deeppink4;#8b0a50
deepskyblue;#00bfff
deepskyblue1;#00bfff
deepskyblue2;#00b2ee
deepskyblue3;#009acd
deepskyblue4;#00688b
dimgray;#696969
dimgrey;#696969
dodgerblue;#1e90ff
dodgerblue1;#1e90ff
dodgerblue2;#1c86ee
dodgerblue3;#1874cd
dodgerblue4;#104e8b
firebrick;#b22222
firebrick1;#ff3030
firebrick2;#ee2c2c
firebrick3;#cd2626
firebrick4;#8b1a1a
floralwhite;#fffaf0
forestgreen;#228b22
gainsboro;#dcdcdc
ghostwhite;#f8f8ff
gold;#ffd700
gold1;#ffd700
gold2;#eec900
gold3;#cdad00
gold4;#8b7500
goldenrod;#daa520
goldenrod1;#ffc125
goldenrod2;#eeb422
goldenrod3;#cd9b1d
goldenrod4;#8b6914
gray;#c0c0c0
gray0;#000000
gray1;#030303
gray10;#1a1a1a
gray100;#ffffff
gray11;#1c1c1c
gray12;#1f1f1f
gray13;#212121
gray14;#242424
gray15;#262626
gray16;#292929
gray17;#2b2b2b
gray18;#2e2e2e
gray19;#303030
gray2;#050505
gray20;#333333
gray21;#363636
gray22;#383838
gray23;#3b3b3b
gray24;#3d3d3d
gray25;#404040
gray26;#424242
gray27;#454545
gray28;#474747
gray29;#4a4a4a
gray3;#080808
gray30;#4d4d4d
gray31;#4f4f4f
gray32;#525252
gray33;#545454
gray34;#575757
gray35;#595959
gray36;#5c5c5c
gray37;#5e5e5e
gray38;#616161
gray39;#636363
gray4;#0a0a0a
gray40;#666666
gray41;#696969
gray42;#6b6b6b
gray43;#6e6e6e
gray44;#707070
gray45;#737373
gray46;#757575
gray47;#787878
gray48;#7a7a7a
gray49;#7d7d7d
gray5;#0d0d0d
gray50;#7f7f7f
gray51;#828282
gray52;#858585
gray53;#878787
gray54;#8a8a8a
gray55;#8c8c8c
gray56;#8f8f8f
gray57;#919191
gray58;#949494
gray59;#969696
gray6;#0f0f0f
gray60;#999999
gray61;#9c9c9c
gray62;#9e9e9e
gray63;#a1a1a1
gray64;#a3a3a3
gray65;#a6a6a6
gray66;#a8a8a8
gray67;#ababab
gray68;#adadad
gray69;#b0b0b0
gray7;#121212
gray70;#b3b3b3
gray71;#b5b5b5
gray72;#b8b8b8
gray73;#bababa
gray74;#bdbdbd
gray75;#bfbfbf
gray76;#c2c2c2
gray77;#c4c4c4
gray78;#c7c7c7
gray79;#c9c9c9
gray8;#141414
gray80;#cccccc
gray81;#cfcfcf
gray82;#d1d1d1
gray83;#d4d4d4
gray84;#d6d6d6
gray85;#d9d9d9
gray86;#dbdbdb
gray87;#dedede
gray88;#e0e0e0
gray89;#e3e3e3
gray9;#171717
gray90;#e5e5e5
gray91;#e8e8e8
gray92;#ebebeb
gray93;#ededed
gray94;#f0f0f0
gray95;#f2f2f2
gray96;#f5f5f5
gray97;#f7f7f7
gray98;#fafafa
gray99;#fcfcfc
green;#00ff00
green1;#00ff00
green2;#00ee00
green3;#00cd00
green4;#008b00
greenyellow;#adff2f
grey;#c0c0c0
grey0;#000000
grey1;#030303
grey10;#1a1a1a
grey100;#ffffff
grey11;#1c1c1c
grey12;#1f1f1f
grey13;#212121
grey14;#242424
grey15;#262626
grey16;#292929
grey17;#2b2b2b
grey18;#2e2e2e
grey19;#303030
grey2;#050505
grey20;#333333
grey21;#363636
grey22;#383838
grey23;#3b3b3b
grey24;#3d3d3d
grey25;#404040
grey26;#424242
grey27;#454545
grey28;#474747
grey29;#4a4a4a
grey3;#080808
grey30;#4d4d4d
grey31;#4f4f4f
grey32;#525252
grey33;#545454
grey34;#575757
grey35;#595959
grey36;#5c5c5c
grey37;#5e5e5e
grey38;#616161
grey39;#636363
grey4;#0a0a0a
grey40;#666666
grey41;#696969
grey42;#6b6b6b
grey43;#6e6e6e
grey44;#707070
grey45;#737373
grey46;#757575
grey47;#787878
grey48;#7a7a7a
grey49;#7d7d7d
grey5;#0d0d0d
grey50;#7f7f7f
grey51;#828282
grey52;#858585
grey53;#878787
grey54;#8a8a8a
grey55;#8c8c8c
grey56;#8f8f8f
grey57;#919191
grey58;#949494
grey59;#969696
grey6;#0f0f0f
grey60;#999999
grey61;#9c9c9c
grey62;#9e9e9e
grey63;#a1a1a1
grey64;#a3a3a3
grey65;#a6a6a6
grey66;#a8a8a8
grey67;#ababab
grey68;#adadad
grey69;#b0b0b0
grey7;#121212
grey70;#b3b3b3
grey71;#b5b5b5
grey72;#b8b8b8
grey73;#bababa
grey74;#bdbdbd
grey75;#bfbfbf
grey76;#c2c2c2
grey77;#c4c4c4
grey78;#c7c7c7
grey79;#c9c9c9
grey8;#141414
grey80;#cccccc
grey81;#cfcfcf
grey82;#d1d1d1
grey83;#d4d4d4
grey84;#d6d6d6
grey85;#d9d9d9
grey86;#dbdbdb
grey87;#dedede
grey88;#e0e0e0
grey89;#e3e3e3
grey9;#171717
grey90;#e5e5e5
grey91;#e8e8e8
grey92;#ebebeb
grey93;#ededed
grey94;#f0f0f0
grey95;#f2f2f2
grey96;#f5f5f5
grey97;#f7f7f7
grey98;#fafafa
grey99;#fcfcfc
honeydew;#f0fff0
honeydew1;#f0fff0
honeydew2;#e0eee0
honeydew3;#c1cdc1
honeydew4;#838b83
hotpink;#ff69b4
hotpink1;#ff6eb4
hotpink2;#ee6aa7
hotpink3;#cd6090
hotpink4;#8b3a62
indianred;#cd5c5c
indianred1;#ff6a6a
indianred2;#ee6363
indianred3;#cd5555
indianred4;#8b3a3a
indigo;#4b0082
ivory;#fffff0
ivory1;#fffff0
ivory2;#eeeee0
ivory3;#cdcdc1
ivory4;#8b8b83
khaki;#f0e68c
khaki1;#fff68f
khaki2;#eee685
khaki3;#cdc673
khaki4;#8b864e
lavender;#e6e6fa
lavenderblush;#fff0f5
lavenderblush1;#fff0f5
lavenderblush2;#eee0e5
lavenderblush3;#cdc1c5
lavenderblush4;#8b8386
lawngreen;#7cfc00
lemonchiffon;#fffacd
lemonchiffon1;#fffacd
lemonchiffon2;#eee9bf
lemonchiffon3;#cdc9a5
lemonchiffon4;#8b8970
lightblue;#add8e6
lightblue1;#bfefff
lightblue2;#b2dfee
lightblue3;#9ac0cd
lightblue4;#68838b
lightcoral;#f08080
lightcyan;#e0ffff
lightcyan1;#e0ffff
lightcyan2;#d1eeee
lightcyan3;#b4cdcd
lightcyan4;#7a8b8b
lightgoldenrod;#eedd82
lightgoldenrod1;#ffec8b
lightgoldenrod2;#eedc82
lightgoldenrod3;#cdbe70
lightgoldenrod4;#8b814c
lightgoldenrodyellow;#fafad2
lightgray;#d3d3d3
lightgrey;#d3d3d3
lightpink;#ffb6c1
lightpink1;#ffaeb9
lightpink2;#eea2ad
lightpink3;#cd8c95
lightpink4;#8b5f65
lightsalmon;#ffa07a
lightsalmon1;#ffa07a
lightsalmon2;#ee9572
lightsalmon3;#cd8162
lightsalmon4;#8b5742
lightseagreen;#20b2aa
lightskyblue;#87cefa
lightskyblue1;#b0e2ff
lightskyblue2;#a4d3ee
lightskyblue3;#8db6cd
lightskyblue4;#607b8b
lightslateblue;#8470ff
lightslategray;#778899
lightslategrey;#778899
lightsteelblue;#b0c4de
lightsteelblue1;#cae1ff
lightsteelblue2;#bcd2ee
lightsteelblue3;#a2b5cd
lightsteelblue4;#6e7b8b
lightyellow;#ffffe0
lightyellow1;#ffffe0
lightyellow2;#eeeed1
lightyellow3;#cdcdb4
lightyellow4;#8b8b7a
limegreen;#32cd32
linen;#faf0e6
magenta;#ff00ff
magenta1;#ff00ff
magenta2;#ee00ee
magenta3;#cd00cd
magenta4;#8b008b
maroon;#b03060
maroon1;#ff34b3
maroon2;#ee30a7
maroon3;#cd2990
maroon4;#8b1c62
mediumaquamarine;#66cdaa
mediumblue;#0000cd
mediumorchid;#ba55d3
mediumorchid1;#e066ff
mediumorchid2;#d15fee
mediumorchid3;#b452cd
mediumorchid4;#7a378b
mediumpurple;#9370db
mediumpurple1;#ab82ff
mediumpurple2;#9f79ee
mediumpurple3;#8968cd
mediumpurple4;#5d478b
mediumseagreen;#3cb371
mediumslateblue;#7b68ee
mediumspringgreen;#00fa9a
mediumturquoise;#48d1cc
mediumvioletred;#c71585
midnightblue;#191970
mintcream;#f5fffa
mistyrose;#ffe4e1
mistyrose1;#ffe4e1
mistyrose2;#eed5d2
mistyrose3;#cdb7b5
mistyrose4;#8b7d7b
moccasin;#ffe4b5
navajowhite;#ffdead
navajowhite1;#ffdead
navajowhite2;#eecfa1
navajowhite3;#cdb38b
navajowhite4;#8b795e
navy;#000080
navyblue;#000080
oldlace;#fdf5e6
olivedrab;#6b8e23
olivedrab1;#c0ff3e
olivedrab2;#b3ee3a
olivedrab3;#9acd32
olivedrab4;#698b22
orange;#ffa500
orange1;#ffa500
orange2;#ee9a00
orange3;#cd8500
orange4;#8b5a00
orangered;#ff4500
orangered1;#ff4500
orangered2;#ee4000
orangered3;#cd3700
orangered4;#8b2500
orchid;#da70d6
orchid1;#ff83fa
orchid2;#ee7ae9
orchid3;#cd69c9
orchid4;#8b4789
palegoldenrod;#eee8aa
palegreen;#98fb98
palegreen1;#9aff9a
palegreen2;#90ee90
palegreen3;#7ccd7c
palegreen4;#548b54
paleturquoise;#afeeee
paleturquoise1;#bbffff
paleturquoise2;#aeeeee
paleturquoise3;#96cdcd
paleturquoise4;#668b8b
palevioletred;#db7093
palevioletred1;#ff82ab
palevioletred2;#ee799f
palevioletred3;#cd6889
palevioletred4;#8b475d
papayawhip;#ffefd5
peachpuff;#ffdab9
peachpuff1;#ffdab9
peachpuff2;#eecbad
peachpuff3;#cdaf95
peachpuff4;#8b7765
peru;#cd853f
pink;#ffc0cb
pink1;#ffb5c5
pink2;#eea9b8
pink3;#cd919e
pink4;#8b636c
plum;#dda0dd
plum1;#ffbbff
plum2;#eeaeee
plum3;#cd96cd
plum4;#8b668b
powderblue;#b0e0e6
purple;#a020f0
purple1;#9b30ff
purple2;#912cee
purple3;#7d26cd
purple4;#551a8b
red;#ff0000
red1;#ff0000
red2;#ee0000
red3;#cd0000
red4;#8b0000
rosybrown;#bc8f8f
rosybrown1;#ffc1c1
rosybrown2;#eeb4b4
rosybrown3;#cd9b9b
rosybrown4;#8b6969
royalblue;#4169e1
royalblue1;#4876ff
royalblue2;#436eee
royalblue3;#3a5fcd
royalblue4;#27408b
saddlebrown;#8b4513
salmon;#fa8072
salmon1;#ff8c69
salmon2;#ee8262
salmon3;#cd7054
salmon4;#8b4c39
sandybrown;#f4a460
seagreen;#2e8b57
seagreen1;#54ff9f
seagreen2;#4eee94
seagreen3;#43cd80
seagreen4;#2e8b57
seashell;#fff5ee
seashell1;#fff5ee
seashell2;#eee5de
seashell3;#cdc5bf
seashell4;#8b8682
sienna;#a0522d
sienna1;#ff8247
sienna2;#ee7942
sienna3;#cd6839
sienna4;#8b4726
skyblue;#87ceeb
skyblue1;#87ceff
skyblue2;#7ec0ee
skyblue3;#6ca6cd
skyblue4;#4a708b
slateblue;#6a5acd
slateblue1;#836fff
slateblue2;#7a67ee
slateblue3;#6959cd
slateblue4;#473c8b
slategray;#708090
slategray1;#c6e2ff
slategray2;#b9d3ee
slategray3;#9fb6cd
slategray4;#6c7b8b
slategrey;#708090
snow;#fffafa
snow1;#fffafa
snow2;#eee9e9
snow3;#cdc9c9
snow4;#8b8989
springgreen;#00ff7f
springgreen1;#00ff7f
springgreen2;#00ee76
springgreen3;#00cd66
springgreen4;#008b45
steelblue;#4682b4
steelblue1;#63b8ff
steelblue2;#5cacee
steelblue3;#4f94cd
steelblue4;#36648b
tan;#d2b48c
tan1;#ffa54f
tan2;#ee9a49
tan3;#cd853f
tan4;#8b5a2b
thistle;#d8bfd8
thistle1;#ffe1ff
thistle2;#eed2ee
thistle3;#cdb5cd
thistle4;#8b7b8b
tomato;#ff6347
tomato1;#ff6347
tomato2;#ee5c42
tomato3;#cd4f39
tomato4;#8b3626
transparent;#fffffe
turquoise;#40e0d0
turquoise1;#00f5ff
turquoise2;#00e5ee
turquoise3;#00c5cd
turquoise4;#00868b
violet;#ee82ee
violetred;#d02090
violetred1;#ff3e96
violetred2;#ee3a8c
violetred3;#cd3278
violetred4;#8b2252
wheat;#f5deb3
wheat1;#ffe7ba
wheat2;#eed8ae
wheat3;#cdba96
wheat4;#8b7e66
white;#ffffff
whitesmoke;#f5f5f5
yellow;#ffff00
yellow1;#ffff00
yellow2;#eeee00
yellow3;#cdcd00
yellow4;#8b8b00
yellowgreen;#9acd32'.

	colorsByName := Dictionary new.
	colorList linesDo:
		[:each | | tokens |
		tokens := each findTokens: ';'.
		colorsByName at: tokens first asSymbol put: (Color fromString: tokens second)].
	
	colorsByName]
]

{ #category : #samples }
GraphViz class >> connectorsDemo [

	"GraphViz connectorsDemo"
	| graph costume |
	self hasConnectorsInstalled ifFalse: [self notify: 'Install Connectors in order to run any GraphViz to Connectors demos'].
	
	graph := self new.
	graph
		name: 'Connectors Demo';
		add: #node with: #style -> #filled;
		add: #Am with: #fillcolor -> #palegreen;
		add: #Dah with: #fillcolor -> #burlywood;
		add: #He with: #fillcolor -> #red1;
		add: #Baz with: #fillcolor -> #yellow3;
		add: #Car with: #fillcolor -> #ivory;
		add: #Am->#Baz->#Car;
		add: #Am->#Dah->#Baz;
		subgraphDo: [graph add: 'Be Ga'->#Am];
		add: #He->#Dah.

	costume := graph displayCostume.
	costume openInWorld
]

{ #category : #samples }
GraphViz class >> createAllOutputFiles [
	"Generate all the output formats listed in GraphViz documentation (as of dot version 2.2).
	Results are files named 'directedGraphSample.*' in the 'dot' folder."

	"GraphViz createAllOutputFiles"

	self new
		beDirected;
		name: #directedGraphSample;
		add: #graph with: {#ratio -> '0.5'};
		add: #node with: {#fontsize -> 10};	
		add: #Smalltalk -> #Squeak;
		add: #Smalltalk -> 'C++';
		add: 'C++' -> #Java;
		add: #Java -> 'C#';
		
		makeAll

]

{ #category : #samples }
GraphViz class >> createAllOutputFormats [
	"Generate all the output formats listed in GraphViz documentation (as of dot version 2.2)."

	"GraphViz createAllOutputFormats"

	| d viz |
	d := Dictionary new.
	viz := self new
		beDirected;
		name: #directedGraphSample1;
		add: #graph with: {#ratio -> '0.5'};
		add: #node with: {#fontsize -> 10};	
		add: #Smalltalk -> #Squeak;
		add: #Smalltalk -> 'C++';
		add: 'C++' -> #Java;
		add: #Java -> 'C#';
		yourself.
	self outputFormats do: [:t | d at: t put: (viz asOutputType: t)].
	^ d
]

{ #category : #accessing }
GraphViz class >> defaultGeneratorClass [

	"GraphViz defaultGeneratorClass"

	| platform className |
	platform := (SmalltalkImage current platformName copyWithout: Character space) capitalized.
	className := (platform , #GraphVizGenerator)  asSymbol.

	"Issue a warning for special case of Mac OS prior to the OS X operating system"
	(platform = 'MacOS' and: [ SmalltalkImage current osVersion asNumber < 1000])
		ifTrue: [self notify: 'GraphViz on Mac OS prior to OS X may not function correctly. ',
					'You may proceed, but errors are possible. Please notify author ',
					' if you are able to confirm GraphViz working on your Mac OS system.'].

	"Use the specific concrete subclass for this platform if implemented"
	(Smalltalk hasClassNamed: className) ifTrue: [^ Smalltalk at: className].

	"Otherwise use OSProcess if possible"
	(platform = 'Unix') ifTrue:
		 [(Smalltalk hasClassNamed: #PipeableOSProcess)
			ifTrue: [^ OSProcessGraphVizGenerator]
			ifFalse: [self notify:
					'Class ' , className , ' not implemented for this platform. ',
					'Load OSProcess and CommandShell to enable GraphViz on ',
					'Unix, Linux, or Mac OS X with Unix VM.'].
					^ nil].

	self notify: SmalltalkImage current platformName, ' is is not yet supported for the GraphViz package for Squeak'.
	^ nil
]

{ #category : #samples }
GraphViz class >> directedGraphSample [

	"GraphViz directedGraphSample"
	| graph |
	graph := self new.

	graph beDirected.
	graph
		name: #directedGraphSample;
		add: #node with: {#fontsize -> 28};
		
		subgraph: #clusterfoo do:
			[graph
				at: #style put: #filled;
				at: #fillcolor put: #lightgrey;
				add: #A -> #B;
				at: #label put: #Foo].
		
	graph
		add: #A -> #J;
		add: #B -> #Z;
		
		add: #graph with: {#label -> 'Cluster Graph'. #fontsize -> 50};
		
		openInWindow
]

{ #category : #accessing }
GraphViz class >> hasConnectorsInstalled [

	^ PackageInfo allPackages anySatisfy: [:each | each externalName = #Connectors]
]

{ #category : #samples }
GraphViz class >> hierarchyForClassesInCategoriesMatching: symbol [

	"GraphViz hierarchyForClassesInCategoriesMatching: 'GraphViz'"
	"GraphViz hierarchyForClassesInCategoriesMatching: 'System-Archives'"
	"GraphViz hierarchyForClassesInCategoriesMatching: 'Collections-Weak'"
	"GraphViz hierarchyForClassesInCategoriesMatching: #DynamicBindings"			

	(SystemOrganization graphForCategoriesMatching: symbol) openInWindow
]

{ #category : #samples }
GraphViz class >> historyOfSmalltalk [

	"GraphViz historyOfSmalltalk"
	| graph |
	graph := self new.
	
	graph
		beDirected;
		name: 'HistoryOfSmalltalk';
		add: #graph with: {#overlap -> #scale. #concentrate -> #true. #ranksep -> 0.25};
		add: #edge with: {#arrowsize -> 0.5};
		
		add: #node with: {#shape -> #plaintext. #fontsize -> 16};
		add: #past ->  '1970s' -> 1980 -> 1983 -> 1985 -> 1991 -> 1993 -> 1995 -> 1996 -> 1998 -> 1999 -> 2000;
		
		add: #node with: {#shape -> #box. #fontsize -> 12. #style -> #filled. #fillcolor -> #ivory. #height -> 0.25};
	
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
		
		openInWindow
]

{ #category : #'class initialization' }
GraphViz class >> initialize [

	colorsByName := nil
]

{ #category : #samples }
GraphViz class >> makeLayoutCoordinates [
	"Answer plain text layout coordinates in a format that could be parsed in Squeak."

	"GraphViz makeLayoutCoordinates explore"

	^ self new
		beDirected;
		name: #directedGraphSample1;
		add: #graph with: {#ratio -> '0.5'};
		add: #node with: {#fontsize -> 10};	
		add: #Smalltalk -> #Squeak;
		add: #Smalltalk -> 'C++';
		add: 'C++' -> #Java;
		add: #Java -> 'C#';
		asLayoutCoordinates

]

{ #category : #'output types' }
GraphViz class >> outputFormats [
	"All the output formats listed in GraphViz documentation (as of dot version 2.2)."

	^ #(
		#canon
		#cmap	"Client-side imagemap"
		#dot	"DOT"
		#fig	"FIG"
		#gd
		#gd2	"GD/GD2 formats"
		#gif	"GIF"
		#hpgl	"HP-GL/2"
		#imap	"Server-side imagemap"
		#ismap	"Server-side imagemap (deprecated)"
		#jpg
		#jpeg	"JPEG"
		#mif	"FrameMaker MIF format"
		#mp	"MetaPost"
		#pcl	"PCL"
		#pic	"PIC"
		#plain
		#'plain-ext'	"Simple text format"
		#png	"Portable Network Graphics format"
		#ps 	"PostScript"
		#ps2	"PostScript for PDF"
		#svg
		#svgz	"Scalable Vector Graphics"
		#vrml	"VRML"
		#vtx	"Visual Thought format"
		#wbmp	"Wireless BitMap format")
]

{ #category : #accessing }
GraphViz class >> pointsPerInch [

	^ 72
]

{ #category : #samples }
GraphViz class >> referencesToClassesInCategoriesMatching: symbol [

	"GraphViz referencesToClassesInCategoriesMatching: 'GraphViz'"
	"GraphViz referencesToClassesInCategoriesMatching: 'System-Archives'"
	"GraphViz referencesToClassesInCategoriesMatching: 'Collections-Weak'"
	"GraphViz referencesToClassesInCategoriesMatching: #DynamicBindings"
			
	| graph edges |
	graph := self new.

	graph
		name: symbol;
		add: #graph with: {#overlap -> #orthoyx. #start -> #rand. #splines -> #true. #bgcolor -> #transparent. #concentrate -> #true};
		add: #node with: {#shape -> #box. #fontsize -> 10. #style -> #filled. #fillcolor -> #tomato. #height -> 0.25};
		add: #edge with: {#arrowtail -> #normal. #arrowsize -> 0.5. #minlen -> 2}.

	edges := Set new.
	(SystemOrganization categoriesMatching: (symbol, '*')) do:
		[:cat |
	
		(SystemOrganization listAtCategoryNamed: cat) do:
			[:klass |
			graph add: klass with: {#fillcolor -> #palegreen}.
			
			(Smalltalk at: klass) allCallsOn do: [:each | edges add: klass -> each classSymbol]]].

		edges do: [:each | graph add: each].

	graph
		add: #graph with: {#label -> symbol. #fontsize -> 20};
		openInWindow
]

{ #category : #samples }
GraphViz class >> undirectedGraphSample [

	"GraphViz undirectedGraphSample"
	| graph |
	graph := self new.

	graph
		name: #undirectedGraphSample;
		add: #graph with: #start -> #rand;
		add: #node with: {#fontsize -> 28};
		
		add: #A -> #X;
		
		add: #node with: #shape -> #box;
		
		add: #J with: {#style -> #filled. #fillcolor -> #red. #label -> 'J\nRed'};
		add: #A -> #J;
		add: #A -> #Z;
		
		add: #graph with: {#label -> 'Test Graph'. #fontsize -> 50};
		
		openInWindow
]

{ #category : #samples }
GraphViz class >> usersOf: aSymbol [

	"GraphViz usersOf: #WeakRegistry"
	"GraphViz usersOf: #Bag"
	| graph  |
	graph := self new.

	graph
		name: (#usersOf, aSymbol) capitalized;
		add: #graph with: {#overlap -> #orthoyx. #start -> #rand. #splines -> #true};
		add: #node with: {#fontsize -> 10. #height -> 0.25. #shape -> #octagon. #style -> #filled. #fillcolor -> #khaki};
		add: aSymbol with: {#fillcolor -> #palegreen};
		add: #edge with: {#len -> 0.75}.
		
	(Smalltalk at: aSymbol) allCallsOn do: 
		[:each |
		graph add: (each classSymbol, '>>', each methodSymbol) with: #label -> (each classSymbol, '>>\n', each methodSymbol).
		graph 
			add: aSymbol -> (each classSymbol, '>>', each methodSymbol)
			with: {#arrowtail -> #normal. #arrowsize -> 0.5}].

	graph
		add: #graph with: {#label -> ('Users of ', aSymbol). #fontsize -> 20};
		
		openInWindow
]

{ #category : #converting }
GraphViz >> asLayoutCoordinates [
	"Create graph layout cooordinates in a format that could be easily parsed in Squeak."

	| lines layout |
	lines := OrderedCollection new.
	layout := (self asOutputType: 'plain-ext') copyReplaceAll: String lf with: String cr.
	
	layout linesDo: [:each | lines add: (self tokenizeLine: each)].
	
	^ lines

]

{ #category : #converting }
GraphViz >> asMorph [

	^ self generator createMorph
]

{ #category : #generating }
GraphViz >> asOutputType: outputFormat [

	^ self generator generateType: outputFormat
]

{ #category : #converting }
GraphViz >> asXml [

	^ self generator createXMLDocument
]

{ #category : #accessing }
GraphViz >> displayCostume [

	^ GraphVizCostume new graph: self
]

{ #category : #layout }
GraphViz >> doLayout [

	| layout graphHeight graphWidth |
	layout := self asLayoutCoordinates.
	
	graphWidth := (layout first third asNumber * self class pointsPerInch) asNumber rounded.
	graphHeight := (layout first fourth asNumber * self class pointsPerInch) asNumber rounded.
	
	extent :=  graphWidth @ graphHeight.
	
	self layoutNodes: (layout select: [:each | each first = #node]).
	self layoutEdges: (layout select: [:each | each first = #edge]).
]

{ #category : #accessing }
GraphViz >> dot [

	^ String streamContents:
		[:stream |
		self writeOn: stream withIndent: 0 for: self]
]

{ #category : #accessing }
GraphViz >> extent [

	"only has a value after calling doLayout"
	^ extent
]

{ #category : #accessing }
GraphViz >> generator [

	^ generator ifNil: [generator := self generatorClass newFor: self]
]

{ #category : #accessing }
GraphViz >> generatorClass [

	^ generatorClass ifNil: [generatorClass := self class defaultGeneratorClass]
]

{ #category : #accessing }
GraphViz >> generatorClass: aClass [

	generatorClass := aClass
]

{ #category : #layout }
GraphViz >> layoutEdges: edgeList [
	
	"format => edge tail head n x1 y1 .. xn yn [label xl yl] style color"
	
	edgeList do:
		[:each | | edge positionOfStyle |
		edge := self edgeNamed: each second -> each third.
		
		edge ifNotNil:
			[ | numberOfVertices pos |
			numberOfVertices := each fourth asNumber.
			positionOfStyle := 5 + (numberOfVertices * 2).
			pos := String streamContents:
				[:stream |
				5 to: positionOfStyle - 1 by: 2 do: 
					[:i |
					stream
						nextPutAll: ((each at: i) asNumber * self class pointsPerInch) rounded asString;
						nextPut: $,;
						nextPutAll: ((each at: i + 1) asNumber * self class pointsPerInch) rounded asString;
						nextPutAll: ' ']].
				edge pos: pos allButLast.
				edge style: (each at: positionOfStyle).
				edge color: (each at: positionOfStyle + 1)]]
]

{ #category : #layout }
GraphViz >> layoutNodes: nodeList [
	
	"format => node name x y width height label style shape color fillcolor"
	
	nodeList do:
		[:each | | node |
		node := self nodeNamed: each second.
		
		node ifNotNil:
			[ | x y |
			x := (each third asNumber * self class pointsPerInch) rounded.
			y := (each fourth asNumber * self class pointsPerInch) rounded.
			
			node pos: x asString, ',', y asString.
			node width: each fifth asNumber.
			node height: each sixth asNumber.
			
			node label: each seventh.
			node style: each eighth.
			node shape: each ninth.
			node color: (each at: 10).
			node fillcolor: (each at: 11)]]
]

{ #category : #generating }
GraphViz >> make: outputFormat [

	^ self generator make: outputFormat
]

{ #category : #generating }
GraphViz >> makeAll [
	"Generate output files in all known formats."

	self class outputFormats do: [:format | self make: format]

]

{ #category : #accessing }
GraphViz >> name [

	^ (self id ifNil: [#UnamedGraph]) asString
]

{ #category : #accessing }
GraphViz >> name: aString [

	self id: aString
]

{ #category : #converting }
GraphViz >> openInWindow [

	| morph window scrollPane |
	
	morph := self asMorph.
	scrollPane := ScrollPane new.
	scrollPane scroller addMorph: morph.
	
	window := (SystemWindow labelled: self name) model: nil.
	window bounds: (morph position - (0 @ window labelHeight + window borderWidth) corner: morph bottomRight + window borderWidth).
	
	window
		addMorph: scrollPane
		frame: (0 @ 0 extent: 1 @ 1).
		
	window setWindowColor: Color lightOrange lighter lighter.
	window openInWorld.
	
	^ window	
]

{ #category : #converting }
GraphViz >> openInteractive [

	self displayCostume openInWorld
]

{ #category : #layout }
GraphViz >> tokenizeLine: line [

	| tokens tokenSoFar insideQuote |
	tokens := OrderedCollection new.
	tokenSoFar := ''.
	insideQuote := false.
	
	line do:
		[:char |
		char = $" ifTrue: [insideQuote := insideQuote not].
		tokenSoFar := (char = Character space and: [insideQuote not])
			ifTrue: [tokenSoFar isEmpty ifFalse: [tokens add: tokenSoFar]. String new]
			ifFalse: [tokenSoFar, char asString]].
	
	tokenSoFar isEmpty ifFalse: [tokens add: tokenSoFar].
	^ tokens collect: [:each | (each beginsWith: '"') ifTrue: [each allButFirst allButLast] ifFalse: [each]]
]
