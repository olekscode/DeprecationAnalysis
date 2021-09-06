Class {
	#name : #BaselineOfDeprecationAnalysis,
	#superclass : #BaselineOf,
	#category : #BaselineOfDeprecationAnalysis
}

{ #category : #baselines }
BaselineOfDeprecationAnalysis >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'Clio'
			with: [ spec repository: 'github://olekscode/Clio/src' ].
			
		"Packages"
		spec 
			package: 'DeprecationAnalysis' with: [ spec requires: #(Clio) ];
			package: 'DeprecationAnalysis-Tests' with: [ spec requires: #(DeprecationAnalysis) ] ]
]