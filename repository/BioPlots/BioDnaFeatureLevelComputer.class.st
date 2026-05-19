"
I compute vertical levels for DNA features that overlap, using a graph coloring algorithm.

Features that overlap are assigned different vertical levels so they don't visually overlap on the plot. The algorithm:
1. Build an overlap graph where edges connect overlapping features
2. Sort features by length (largest first)
3. Assign each feature the lowest level that doesn't conflict with its neighbors

Example:
    computer := BioDnaFeatureLevelComputer new.
    levels := computer computeLevelsFor: features.
    level := levels at: aFeature.
    
    Or use the class-side convenience method:
    levels := BioDnaFeatureLevelComputer levelsFor: features.
"
Class {
	#name : 'BioDnaFeatureLevelComputer',
	#superclass : 'Object',
	#category : 'BioPlots-FeaturesViewer',
	#package : 'BioPlots',
	#tag : 'FeaturesViewer'
}

{ #category : 'instance creation' }
BioDnaFeatureLevelComputer class >> levelsFor: features [
    ^ self new computeLevelsFor: features
]

{ #category : 'private' }
BioDnaFeatureLevelComputer >> collisionAt: level with: node in: graph levels: levels [
    | nlines |
    nlines := node data at: #nlines ifAbsent: [ 1 ].
    (graph at: node) do: [ :neighbor |
        | neighborLevel |
        neighborLevel := levels at: neighbor ifAbsent: [ nil ].
        neighborLevel ifNotNil: [
            | neighborLines minDistance |
            neighborLines := neighbor data at: #nlines ifAbsent: [ 1 ].
            minDistance := 0.5 * (nlines + neighborLines).
            (level - neighborLevel) abs < minDistance ifTrue: [ ^ true ] ] ].
    ^ false
]

{ #category : 'computing' }
BioDnaFeatureLevelComputer >> computeLevelsFor: features [
    | levels graph |
    features ifEmpty: [ ^ Dictionary new ].
    levels := Dictionary new.
    features do: [ :f | levels at: f put: (f data at: #fixedLevel ifAbsent: [ nil ]) ].
    graph := Dictionary new.
    features do: [ :f | graph at: f put: OrderedCollection new ].
    1 to: features size do: [ :i |
        i + 1 to: features size do: [ :j |
            | fi fj |
            fi := features at: i.
            fj := features at: j.
            (fi overlapsWith: fj) ifTrue: [
                (graph at: fi) add: fj.
                (graph at: fj) add: fi ] ] ].
    (features asArray sort: [ :a :b | a length > b length ]) do: [ :node |
        (levels at: node) ifNil: [
            | level |
            level := 0.
            [ self collisionAt: level with: node in: graph levels: levels ] whileTrue: [ level := level + 0.5 ].
            levels at: node put: level ] ].
    ^ levels
]
