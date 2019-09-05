"
Utility class to hold different lists of species.

Currently contains common names found in FAO (Food and Agriculture Organization)

currentSpecies	<Symbol>		Selector for retrieving class side list.

"
Class {
	#name : #BioSpeciesLists,
	#superclass : #BioNamedObject,
	#instVars : [
		'currentSpecies'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioSpeciesLists class >> commonAnimalSpecies [
	" Answer a <Collection> of common animal species names in english language "

	^ #('Aardvark'
'Elephant'
'Albatross'
'Alligator'
'Alpaca'
'Anaconda'
'Ant'
'Anteater'
'Antelope'
'Armadillo'
'Puffin'
'Horse'
'Baboon'
'Badger'
'Eagle'
'Bandicoot'
'Tiger'
'Barnacle'
'Barracuda'
'Basilisk'
'Bass'
'Hound'
'Bat'
'Dragon'
'Beaver'
'Bee'
'Beetle'
'Whale'
'Sheep'
'Bison'
'Goat'
'Bear'
'Fly'
'Rhino'
'Spider'
'Blackbird'
'Blowfish'
'Boa'
'Boar'
'Bonobo'
'Dolphin'
'Boxer'
'Buck'
'Budgie'
'Buffalo'
'Frog'
'Butterfly'
'Buzzard'
'Caribou'
'Cheetah'
'Seal'
'Caiman'
'Camel'
'Canary'
'Carp'
'Cat'
'Caterpillar'
'Cattle'
'Catfish'
'Chameleon'
'Centipede'
'Chicken'
'Chimpanzee'
'Chihuahua'
'Chinchilla'
'Chipmunk'
'Clam'
'Chupacabra'
'Cobra'
'Cockatiel'
'Cockatoo'
'Cockroach'
'Cod'
'Coho'
'Snake'
'Cougar'
'Cow'
'Coyote'
'Crab'
'Crane'
'Crawfish'
'Cricket'
'Crocodile'
'Crow'
'Deer'
'Dog'
'Degus'
'Dingo'
'Dinosaur'
'Donkey'
'Dove'
'Dragonfly'
'Drake'
'Duck'
'Platypus'
'Lynx'
'Eagle'
'Echidna'
'Eclectus'
'Eel'
'Egret'
'Elk'
'Emu'
'Erne'
'Falcon'
'Finch'
'Fish'
'Firefly'
'Flamingo'
'Flatworm'
'Fly'
'Ferret'
'Fox'
'Frog'
'Iguana'
'Tortoise'
'Gazelle'
'Panda'
'Giraffe'
'Goat'
'Goose'
'Gopher'
'Gorilla'
'Grasshopper'
'Turtle'
'Groundhog'
'Hare'
'Hawk'
'Hedgehog'
'Heron'
'Herring'
'Hippopotamus'
'Horse'
'Hyena'
'Hyrax'
'Iguana'
'Impala'
'Jellyfish'
'Jackal'
'Jackrabbit'
'Jaguar'
'Kangaroo'
'Cobra'
'Kingfisher'
'Koala'
'Kookaburra'
'Krill'
'Lama'
'Lamb'
'Lancelet'
'Leech'
'Lemming'
'Lemur'
'Leopard'
'Lice'
'Lion'
'Lionfish'
'Llama'
'Lobster'
'Lynx'
'Manatee'
'Mantis'
'Marmot'
'Marsupials'
'Meerkat'
'Mink'
'Mole'
'Mollusks'
'Mongoose'
'Monkey'
'Moose'
'Mouse'
'Mule'
'Muskox'
'Muskrat'
'Narwhal'
'Nautilus'
'Nene'
'Newt'
'Nutria'
'Nyala'
'Ocelot'
'Octopus'
'Okapi'
'Opossum'
'Orangutan'
'Orca'
'Osprey'
'Ostrich'
'Otter'
'Owl'
'Ox'
'Panda'
'Panther'
'Peacock'
'Pelican'
'Penguin'
'Pig'
'Pigeon'
'Platypus'
'Potto'
'Porcupine'
'Mantis'
'Prawn'
'Puma'
'Quail'
'Quetzal'
'Rabbit'
'Raccoon'
'Rat'
'Ray'
'Reindeer'
'Rhino'
'Rhinoceros'
'Robin'
'Rooster'
'Roundworm'
'Salmon'
'Crocodile'
'Sandpiper'
'Seahorse'
'Seal'
'Anemone'
'Urchin'
'Scallop'
'Scorpion'
'Shark'
'Sheep'
'Shrimp'
'Sloth'
'Slugs'
'Snails'
'Snake'
'Hare'
'Fox'
'Leopard'
'Sponge'
'Squid'
'Squirrel'
'Starfish'
'Stork'
'Swan'
'Swordfish'
'Tapir'
'Tiger'
'Tadpole'
'Tamarin'
'Tapeworm'
'Tarantula'
'Tarpan'
'Terrapin'
'Tick'
'Tortoise'
'Trout'
'Turkey'
'Turtle'
'Uakari'
'Urchin'
'Urutu'
'Vicuna'
'Viper'
'Vulture'
'Raptor'
'Vole'
'Vervet'
'Walrus'
'Warbler'
'Warthog'
'Wasp'
'Buffalo'
'Wallaby'
'Whale'
'Whippet'
'Whooper'
'Weasel'
'Weevil'
'Wolf'
'Wolverine'
'Woodchuck'
'Woodpecker'
'Wren'
'Wombat'
'Wildcat'
'Wildebeest'
'Xantus'
'Xenop'
'Yak'
'Yeti'
'Zander'
'Zebra'
'Zorilla'
'Zebu').
]

{ #category : #'instance creation' }
BioSpeciesLists class >> currentSpeciesList [
	" Answer a <Collection> with receiver's default species names "

	^ self new currentSpeciesList
]

{ #category : #accessing }
BioSpeciesLists class >> faoSpecies [
	" Answer a <Collection> of FAO species in english language "

	^ #('Ass' 'Bactrian Camel' 'Buffalo' 'Cassowary' 'Cattle' 'Chicken' 'Chilean Tinamou' 'Deer' 'Canis' 'Dromedary' 'Dromedary/Bactrian Camel' 'Duck' 'Duck(domestic)/Muscovy duck' 'Emu' 'Goat' 'Goose' 'Guanaco' 'Guinea fowl' 'Guinea Pig' 'Horse' 'Llama' 'Muscovy duck' 'Nandu' 'Ostrich' 'Partridge' 'Peacock' 'Pheasant' 'Pig' 'Pigeon' 'Quail' 'Rabbit' 'Sheep' 'Swallow' 'Turkey' 'Vicuña' 'Yak').
]

{ #category : #accessing }
BioSpeciesLists class >> faoSpeciesWithChr [
	" Answer a <Collection> of FAO species in english language, and the number of haploid chromosomes "

	^ Dictionary newFromPairs: { 
	'Ass' . 31 .
	'Bactrian Camel' . 37 .
	'Buffalo' . 25 .
	'Cattle' . 29 .
	'Chicken' . 39 .
	'Canis' . 39 .
	'Goat' . 30 .
	'Horse' . 32 .
	'Pig' . 19 .
	'Rabbit' . 22 .
	'Sheep'  .  27 .
	'Yak' . 30 
	}.
]

{ #category : #accessing }
BioSpeciesLists >> currentSpecies [
	^ currentSpecies
		ifNil: [ currentSpecies := self defaultSpeciesList ]
]

{ #category : #accessing }
BioSpeciesLists >> currentSpecies: anObject [
	currentSpecies := anObject
]

{ #category : #accessing }
BioSpeciesLists >> currentSpeciesList [
	" Answer a <Collection> of selected current species "

	^ self class perform: self currentSpecies 
]

{ #category : #defaults }
BioSpeciesLists >> defaultSpeciesList [
	" Private - Answer the default selector for retrieving list "

	^ #faoSpecies

]
