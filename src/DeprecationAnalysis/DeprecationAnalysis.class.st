Class {
	#name : #DeprecationAnalysis,
	#superclass : #Object,
	#instVars : [
		'repositoryOwner',
		'repositoryName',
		'version',
		'deprecatedMethods'
	],
	#category : #DeprecationAnalysis
}

{ #category : #'as yet unclassified' }
DeprecationAnalysis >> classifyDeprecationsByRules [

	| classification |
	
	classification := 'Deprecated methods' ~ [ :method | method isDeprecated ] -> { 
		'Rewriting' ~ [ :method | method deprecation isTransforming ] -> { 
			'Valid rule' ~ [ :method | method deprecation transformationRule isValid ] .
			'Invalid rule' ~ [ :method | method deprecation transformationRule isValid not ] } .
		'Non-rewriting' ~ [ :method | method deprecation isTransforming not ] }.
		
	^ classification accept: self deprecatedMethods.
]

{ #category : #'as yet unclassified' }
DeprecationAnalysis >> classifyDeprecationsBySelectors [

	| selectors classification |
	
	selectors := #(
		deprecated:
		deprecated:on:in:
		deprecated:on:in:transformWith:
		deprecated:on:in:transformWith:when:
		deprecated:transformWith:
		deprecated:transformWith:when:).

	classification := 'Deprecated methods' ~ [ :method | method isDeprecated ] -> (
		selectors collect: [ :selector |
			selector ~ [ :method |
				method methodCalls anySatisfy: [ :call | call selector = selector ] ] ]).
		
	^ classification accept: self deprecatedMethods.
]

{ #category : #'as yet unclassified' }
DeprecationAnalysis >> deprecatedMethods [

	deprecatedMethods ifNil: [ 
		self extractDeprecatedMethods ].
	
	^ deprecatedMethods
]

{ #category : #'as yet unclassified' }
DeprecationAnalysis >> extractDeprecatedMethods [

	| collector packages methods |

	collector := ClioDataCollector new
		repositoryName: repositoryName;
		repositoryOwner: repositoryOwner;
		locateRepository;
		doNotExtractUnderstoodSelectors;
		yourself.

	packages := collector loadPackagesAtCommit: version.

	methods := packages flatCollect: [ :package |
		package classes flatCollect: [ :aClass |
			aClass methods ] ].

	deprecatedMethods := methods select: [ :each | each isDeprecated ].
]

{ #category : #accessing }
DeprecationAnalysis >> repositoryName: anObject [

	repositoryName := anObject
]

{ #category : #accessing }
DeprecationAnalysis >> repositoryOwner: anObject [

	repositoryOwner := anObject
]

{ #category : #'as yet unclassified' }
DeprecationAnalysis >> rewritingDeprecations [
	"Deprecations that contain a transformation rule and can rewrite client senders"
	
	^ self deprecatedMethods select: [ :each | each isTransforming ]
]

{ #category : #accessing }
DeprecationAnalysis >> version: anObject [

	version := anObject
]
