//
//  CardView.swift
//  NetflixOnBoardApp
//
//  Created by Pouya Sadri on 31/01/2024.
//

import SwiftUI

struct CardView: View {
	
	var card : Card
	
    var body: some View {
		VStack{
			
			Image(card.image)
				.resizable()
				.scaledToFit()
				.frame(width: 400,height: 400)
			
			Text(card.title)
				.font(.system(size: 35))
				.fontWeight(.bold)
				.foregroundStyle(.white)
			
			Text(card.description)
				.fontWeight(.light)
				.multilineTextAlignment(.center)
				.font(.system(size: 22))
				.foregroundStyle(.white)
				.frame(width: 335,height: 100)
				.padding(5)
		}
		.padding()
		.offset(x:0,y:0)
    }
}

#Preview {
    CardView(card: testData[1])
}
