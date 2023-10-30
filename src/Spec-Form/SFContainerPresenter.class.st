Class {
	#name : 'SFContainerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'memento',
		'description',
		'parent',
		'presenterBuilderClass',
		'title'
	],
	#category : 'Spec-Form',
	#package : 'Spec-Form'
}

{ #category : 'private' }
SFContainerPresenter class >> defaultPresenterBuilder [

	^ SFGridPresenterBuilder
]

{ #category : 'instance creation' }
SFContainerPresenter class >> memento: aMemento [
	
	^ self 
		memento: aMemento 
		description: aMemento simpleReneDescription
]

{ #category : 'instance creation' }
SFContainerPresenter class >> memento: aMemento description: aDescription [

	^ self 
		memento: aMemento 
		description: aDescription 
		parent: nil
]

{ #category : 'instance creation' }
SFContainerPresenter class >> memento: aMemento description: aDescription parent: aComponent [
	
	^ self basicNew
		initializeMemento: aMemento
			description: aDescription
			parent: aComponent;
		yourself
]

{ #category : 'building' }
SFContainerPresenter >> build [

	self presenterBuilderClass new 
		presenter: self;
		visit: self description
]

{ #category : 'accessing' }
SFContainerPresenter >> description [

	^ description
]

{ #category : 'initialization' }
SFContainerPresenter >> initialize [
	
	super initialize.
	self build
]

{ #category : 'initialization' }
SFContainerPresenter >> initializeMemento: aMemento description: aDescription parent: aParent [ 
	
	memento := aMemento.
	description := aDescription.
	parent := aParent.
	
	self initialize
]

{ #category : 'accessing' }
SFContainerPresenter >> initializeWindow: aWindowPresenter [
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter 
		title: description label;
		initialExtent: description initialExtent
]

{ #category : 'accessing' }
SFContainerPresenter >> memento [

	^ memento
]

{ #category : 'accessing' }
SFContainerPresenter >> parent [

	^ parent
]

{ #category : 'accessing' }
SFContainerPresenter >> presenterBuilderClass [

	^ presenterBuilderClass ifNil: [ self class defaultPresenterBuilder ]
]

{ #category : 'accessing' }
SFContainerPresenter >> presenterBuilderClass: anObject [

	presenterBuilderClass := anObject
]
