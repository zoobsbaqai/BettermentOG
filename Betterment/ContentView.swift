//
//  ContentView.swift
//  Betterment
//
//  Created by Zohair Baqai on 2024-08-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray2), Color(UIColor.darkGray)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .fill(Color.black)
                    .cornerRadius(35)
                    .frame(height: geometry.size.height / 3.45)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 7)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape")
                        .font(.title)
                        .foregroundColor(.white)
                        .position(CGPoint(x: 350.0, y: 30.0))
                }
                HStack {
                    Text("Better")
                        .foregroundStyle(Color(UIColor.yellow))
                        .font(.custom("Fredoka-SemiBold", size: 56))
                        .position(CGPoint(x: 95.0, y: 50.0))
                    Text("ment")
                        .foregroundStyle(.white)
                        .font(.custom("Fredoka-SemiBold", size: 56))
                        .position(CGPoint(x: 38, y: 50))

                }
                VStack {
                    Text("\"one day or day one?\"")
                        .foregroundStyle(.white)
                        .font(.custom("Fredoka-SemiBold", size: 35))
                        .position(CGPoint(x: 195, y: 100.0))
                
                        
                }
                    
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
