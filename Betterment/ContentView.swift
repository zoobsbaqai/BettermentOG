//  ContentView.swift
//  Betterment APP
//  Created by Zohair Baqai on 2024-08-06.

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray2), Color(UIColor.darkGray)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                        .edgesIgnoringSafeArea(.all)
                    
                    Rectangle()
                        .fill(Color.black)
                        .cornerRadius(25)
                        .frame(height: geometry.size.height / 3.5)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 7)
                        .edgesIgnoringSafeArea(.all)
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .font(.title)
                            .foregroundColor(.yellow)
                            .position(CGPoint(x: 350.0, y: 30.0))
                    }
                    
                    RoutPlanScroll()
                        .position(x: 197, y: 600)
                    
                    Text("Routine Plans")
                        .font(.custom("Fredoka-SemiBold", size: 36))
                        .position(CGPoint(x: 130.0, y: 195.0))
                    
                    
                    HStack {
                        Text("Better")
                            .foregroundStyle(.yellow)
                            .font(.custom("Fredoka-SemiBold", size: 56))
                            .position(CGPoint(x: 95.0, y: 45.0))
                        
                        Text("ment")
                            .foregroundStyle(.white)
                            .font(.custom("Fredoka-SemiBold", size: 56))
                            .position(CGPoint(x: 38, y: 45))
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
}

struct SettingsView: View {
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray2), Color(UIColor.darkGray)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .fill(Color.black)
                    .cornerRadius(35)
                    .frame(height: geometry.size.height / 3.45)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 7)
                    .edgesIgnoringSafeArea(.all)
                
                Text("Settings")
                    .font(.custom("Fredoka-SemiBold", size: 56))
                    .foregroundStyle(.white)
                    .position(CGPoint(x: 195.0, y: 50.0))
            }
        }
    }
}

struct RoutPlanScroll: View {
    
    let imageNames = ["TemplateCard", "TemplateCard", "TemplateCard"]
    let buttonNames = ["LetsGo", "LetsGo", "LetsGo"]
    
    var body: some View {
        ScrollView {
            ZStack{
                VStack(spacing: 20) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Image(imageName)
                        
                    }
                    
                    Spacer()
                        .frame(height: 190)
                }
                VStack(spacing: 20) {
                    ForEach(buttonNames, id: \.self) {buttonName in
                        Image(buttonName)
                            .position(CGPoint(x: 70.0, y: 265.0))
                        Spacer()
                            .frame(height: 230)
                    }
                    Spacer()
                        .frame(height: 190)
                }
                Text("Project 50")
                    .font(.custom("Fredoka-SemiBold", size: 28))
                    .foregroundStyle(.black)
                    .position(CGPoint(x: 90.0, y: 216))
                Text("75 Hard")
                    .font(.custom("Fredoka-SemiBold", size: 28))
                    .foregroundStyle(.black)
                    .position(CGPoint(x: 72.5, y: 545.0))
                Text("Betterment30")
                    .font(.custom("Fredoka-SemiBold", size: 28))
                    .foregroundStyle(.black)
                    .position(CGPoint(x: 110.0, y: 876))
                Image("p50thumbnail")
                    .position(CGPoint(x: 185.0, y: 0.0))
                    .scaleEffect(0.825)
                Image("75hardthumb")
                    .position(CGPoint(x: 90.0, y: 375.0))
                    .scaleEffect(0.75)
                Image("bettermentlogo-transformed")
                    .scaleEffect(0.2)
                    .position(CGPoint(x: 104.0, y: 765.0))
            }
            .padding()
        }
        .fadeOutTop()
        
    }
}

extension View {
    func fadeOutTop(fadeLength:CGFloat=25) -> some View {
        return mask(
            VStack(spacing: 0) {
                
                // Top gradient
                LinearGradient(gradient:
                                Gradient(
                                    colors: [Color.black.opacity(0), Color.black]),
                               startPoint: .top, endPoint: .bottom
                )
                .frame(height: fadeLength)
                
                Rectangle().fill(Color.black)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

