//
//  LottieView.swift
//  NetflixOnBoardApp
//
//  Created by Pouya Sadri on 31/01/2024.
//

import SwiftUI
import Lottie

struct LottieView : UIViewRepresentable{
	var filename : String
	
	func makeUIView(context: Context) -> some UIView {
		let view = UIView(frame: .zero)
		let animationView = LottieAnimationView()
		animationView.animation = LottieAnimation.named(filename)
		animationView.contentMode = .scaleAspectFit
		animationView.loopMode = .repeat(1)
		animationView.play{ isFinished in
			print(isFinished ? "Animation Played" : "Animation not played")
		}
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(animationView)
		
		NSLayoutConstraint.activate([
			animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
			animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
		])
		
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
}
