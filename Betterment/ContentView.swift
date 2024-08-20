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
                    
                    RoutPlans()
                        .position(x: 197, y: 600)
                    
                    Text("Routine Plans")
                        .font(.custom("Fredoka-SemiBold", size: 36))
                        .position(CGPoint(x: 130.0, y: 195.0))
                 
                    
                    HStack {
                        Text("Better")
                            .foregroundStyle(.yellow)
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

struct RoutPlans: View {
    
    let imageNames = ["TemplateCard", "TemplateCard", "TemplateCard"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                }
                Spacer()
                    .frame(height: 200)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
