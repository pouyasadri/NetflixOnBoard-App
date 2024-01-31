//
//  Card.swift
//  NetflixOnBoardApp
//
//  Created by Pouya Sadri on 31/01/2024.
//

import Foundation


struct Card : Identifiable {
	var id : UUID = UUID()
	var image : String
	var title : String
	var description : String
}

var testData:[Card] = [

	 
 Card( image: "blank",title: "Trying to join Netflix", description: "You can't sign up for Netflix in the app. We know it's a hassle."),

 Card(image: "screen1", title: "Watch on any Device", description: "Stream on your phone, tablet, laptop, and TV without paying more."),
 
 Card( image: "screen2",title: "Download and Go", description: "Save your data, watch offline on a plane,train, or rocket."),
 
 Card( image: "screen3",title: "No pesky Contracts", description: "Join today, cancel anytime."),

]
