Class {
	#name : #SFPresenterBuilder,
	#superclass : #SRVisitor,
	#traits : 'SpTPresenterBuilder',
	#classTraits : 'SpTPresenterBuilder classTrait',
	#instVars : [
		'presenter'
	],
	#category : #'Spec-Form'
}

{ #category : #'instance creation' }
SFPresenterBuilder >> instantiate: aPresenterClass [
	"Instantiate a SpPresenter subclass and set its instance owner"

	^ aPresenterClass owner: self presenter
]

{ #category : #'instance creation' }
SFPresenterBuilder >> instantiate: aPresenterClass on: aModel [
	"Instantiate a SpPresenter subclass and set its instance owner and model"

	^ aPresenterClass 
		owner: self presenter 
		on: aModel
]

{ #category : #accessing }
SFPresenterBuilder >> memento [

	^ self presenter memento
]

{ #category : #accessing }
SFPresenterBuilder >> presenter [

	^ presenter
]

{ #category : #accessing }
SFPresenterBuilder >> presenter: anObject [

	presenter := anObject
]
