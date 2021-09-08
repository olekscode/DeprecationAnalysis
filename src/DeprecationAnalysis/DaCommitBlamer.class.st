Class {
	#name : #DaCommitBlamer,
	#superclass : #Object,
	#instVars : [
		'commits'
	],
	#category : #DeprecationAnalysis
}

{ #category : #'as yet unclassified' }
DaCommitBlamer class >> basedOn: aCollectionOfCommits [

	^ self new
		commits: aCollectionOfCommits;
		yourself
]

{ #category : #'history search' }
DaCommitBlamer >> commitThatAddedDeprecatedMethodWithSignature: aSignature [
	"Find last commit that added a given deprecated method"
	
	^ commits reversed
		detect: [ :aCommit |
			aCommit addedMethods anySatisfy: [ :each |
				each signature = aSignature and: [
					each isDeprecated and: [
						(self isMergeCommit: aCommit) not ] ] ] ]
		ifNone: [ nil ].
	
]

{ #category : #'history search' }
DaCommitBlamer >> commitThatAddedDeprecationToMethodWithSignature: aSignature [
	"Find last commit that modified a given method by adding a deprecation into its source code"
	
	^ commits reversed
		detect: [ :aCommit |
			aCommit modifiedMethods anySatisfy: [ :each |
				each oldDefinition signature = aSignature and: [
					each oldDefinition isDeprecated not and: [
						each newDefinition isDeprecated and: [
							(self isMergeCommit: aCommit) not ] ] ] ] ]
		ifNone: [ nil ].
	
]

{ #category : #'history search' }
DaCommitBlamer >> commitThatDeprecatedMethod: aMethod [
	^ self commitThatDeprecatedMethodWithSignature: aMethod signature
]

{ #category : #'history search' }
DaCommitBlamer >> commitThatDeprecatedMethodWithSignature: aSignature [
	"Answer the most recent commit that either added deprecation into the method (by modifying its source code) or added the deprecated method itself (i.e. the method was removed earlier and then reintroduced with deprecation)"
	
	| added modified |
	
	modified := self commitThatAddedDeprecationToMethodWithSignature: aSignature.
	added := self commitThatAddedDeprecatedMethodWithSignature: aSignature.
	
	modified ifNil: [ ^ added ].
	added ifNil: [ ^ modified ].
	
	^ (added datetime > modified datetime)
		ifTrue: [ added ]
		ifFalse: [ modified ].
]

{ #category : #accessing }
DaCommitBlamer >> commits: anObject [

	commits := anObject
]

{ #category : #'history search' }
DaCommitBlamer >> isMergeCommit: aCommit [
	^ aCommit comment beginsWith: 'Merge'
]
