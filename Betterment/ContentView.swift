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
                    .fill(.black)
                    .frame(height: geometry.size.height / 2.5)
                    .position(x: geometry.size.width / 2)
                HStack {
                    Text("Better")
                        .foregroundStyle(Color(UIColor.yellow))
                        .font(.custom("Fredoka", size: 56))
                        .position(CGPoint(x: 95.0, y: 50.0))
                    Text("ment")
                        .foregroundStyle(.white)
                        .font(.custom("Chalkboard SE", size: 56))
                        .position(CGPoint(x: 42, y: 50))
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
    
