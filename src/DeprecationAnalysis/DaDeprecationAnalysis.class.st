Class {
	#name : #DaDeprecationAnalysis,
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
DaDeprecationAnalysis >> classifyDeprecatedMethodsByRules [

	| classification |
	
	classification := 'Deprecated methods' ~ [ :method | method isDeprecated ] -> { 
		'Rewriting' ~ [ :method | method deprecation isTransforming ] -> { 
			'Valid rule' ~ [ :method | method deprecation transformationRule isValid ] .
			'Invalid rule' ~ [ :method | method deprecation transformationRule isValid not ] } .
		'Non-rewriting' ~ [ :method | method deprecation isTransforming not ] }.
		
	^ classification accept: self deprecatedMethods.
]

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> classifyDeprecatedMethodsBySelectors [

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
DaDeprecationAnalysis >> classifyDeprecationsByScenarios [

	| classification |
	classification := DeprecationCategory new.
	^ classification accept: self deprecations.
]

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> deprecatedMethods [

	deprecatedMethods ifNil: [ 
		self extractDeprecatedMethods ].
	
	^ deprecatedMethods
]

{ #category : #accessing }
DaDeprecationAnalysis >> deprecations [

	^ self deprecatedMethods collect: [ :each | each asDaDeprecation ].
]

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> extractDeprecatedMethods [

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

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> invalidRewritingDeprecations [

	^ self rewritingDeprecations reject: [ :each | each transformationRule isValid ]
]

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> nonRewritingDeprecations [
	"Deprecations that do not contain a transformation rule"
	
	^ self deprecations reject: [ :each | each isTransforming ]
]

{ #category : #accessing }
DaDeprecationAnalysis >> repositoryName: anObject [

	repositoryName := anObject
]

{ #category : #accessing }
DaDeprecationAnalysis >> repositoryOwner: anObject [

	repositoryOwner := anObject
]

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> rewritingDeprecations [
	"Deprecations that contain a transformation rule and can rewrite client senders"
	
	^ self deprecations select: [ :each | each isTransforming ]
]

{ #category : #'as yet unclassified' }
DaDeprecationAnalysis >> validRewritingDeprecations [

	^ self rewritingDeprecations select: [ :each | each transformationRule isValid ]
]

{ #category : #accessing }
DaDeprecationAnalysis >> version: anObject [

	version := anObject
]
