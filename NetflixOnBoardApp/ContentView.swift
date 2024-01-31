//
//  ContentView.swift
//  NetflixOnBoardApp
//
//  Created by Pouya Sadri on 31/01/2024.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isShowingSplashScreen = true
	
    var body: some View {
		Group{
			if isShowingSplashScreen {
				SpalshScreenView()
					.transition(.opacity)
			} else{
				MainView()
			}
		}
		.onAppear{
			DispatchQueue.main.asyncAfter(deadline: .now() + 4){
				withAnimation{
					self.isShowingSplashScreen = false
				}
			}
		}
    }
}

#Preview {
    ContentView()
}

//MARK: - Main View

struct MainView : View {
	
	init(){
		UIPageControl.appearance().currentPageIndicatorTintColor = .red
		UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.8)
	}
	
	@State private var selectedPage = 0
	var body: some View {
		ZStack{
			Color.black
				.ignoresSafeArea()
			
			Group{
				if selectedPage == 0 {
					backgroundView
				}
			}
			
			content
			
			if selectedPage >= 1 && selectedPage <= 3 {
				TopNavView()
			}
		}
	}
	
	private var backgroundView : some View{
		ZStack{
			Image("screen")
				.resizable()
				.opacity(0.8)
				.ignoresSafeArea()
			
			Image("gradient")
				.resizable()
				.ignoresSafeArea()
		}
	}
	
	private var content : some View{
		VStack{
			TabView(selection: $selectedPage){
				ForEach(0..<testData.count,id:\.self){ index in
						CardView(card: testData[index])
						.tag(index)
				}
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
			.offset(y: 20)
			
			signInButton
		}
	}
	
	private var signInButton : some View{
		RoundedRectangle(cornerRadius: 10)
			.frame(width: 380,height: 75)
			.foregroundStyle(Color("buttonbg"))
			.overlay(
				Text("SIGN IN")
					.fontWeight(.regular)
					.font(.system(size: 26))
					.foregroundStyle(.white)
					.shadow(color: .gray,radius: 1, x: 1, y: 1)
				)
	}
}

//MARK: - Spash screen view
struct SpalshScreenView : View {
	var body: some View {
		ZStack{
			Color.black
				.ignoresSafeArea()
			
			LottieView(filename: "netflix")
		}
	}
}


//MARK: - top nav view
struct TopNavView : View {
	var body: some View {
		VStack{
			HStack{
				Image("netflixlogo")
					.resizable()
					.frame(width: 110,height: 62)
				
				Spacer()
				
				Group{
					Text("Help")
						Spacer()
						.frame(width: 10)
						Text("Privacy")
				}
				.font(.headline)
				.foregroundColor(.white)
			}
			Spacer()
		}
		.padding()
	}
}
