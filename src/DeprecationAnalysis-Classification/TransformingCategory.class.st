Class {
	#name : #TransformingCategory,
	#superclass : #DeprecationCategory,
	#category : #'DeprecationAnalysis-Classification'
}

{ #category : #accessing }
TransformingCategory >> condition [
	^ [ :deprecation | deprecation isTransforming ]
]

{ #category : #accessing }
TransformingCategory >> name [
	^ 'Transforming deprecations'
]
