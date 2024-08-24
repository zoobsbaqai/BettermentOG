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
    @State private var isNotificationsEnabled = false // State variable for the toggle
    
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
                    .position(CGPoint(x: 195.0, y: 40.0))
                
                VStack(spacing: 1) {
                    Image("notiTab")
                        .scaleEffect(1.13)
                        .padding(.bottom, 8)
                    
                    HStack {
                        Text("Push Notifications")
                            .font(.custom("Inter", size: 20))
                            .padding(.top, 20)
                        
                        Spacer()
                        
                        Toggle("", isOn: $isNotificationsEnabled)
                            .labelsHidden()
                            .padding(.top, 20)
                    }
                    .padding(.horizontal, 24)
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height / 4)
            }
        }
    }
}

struct RoutPlanScroll: View {
    let imageNames = ["TemplateCard", "TemplateCard", "TemplateCard"]
    let buttonNames = ["LetsGo", "LetsGo", "LetsGo"]
    let infNames = ["infBut", "infBut", "infBut"]
    
    @State private var showPopup = false
    @State private var popupTitle = ""
    @State private var popupMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    VStack(spacing: 20) {
                        ForEach(imageNames, id: \.self) { imageName in
                            Image(imageName)
                        }
                        Spacer()
                            .frame(height: 190)
                    }
                    VStack(spacing: 20) {
                        ForEach(buttonNames.indices, id: \.self) { index in
                            NavigationLink(destination: getDestinationView(index: index)) {
                                Image(buttonNames[index])
                            }
                            .position(CGPoint(x: 70.0, y: 265.0))
                            Spacer()
                                .frame(height: 230)
                        }
                        Spacer()
                            .frame(height: 190)
                    }
                    VStack(spacing: 20) {
                        ForEach(infNames.indices, id: \.self) { index in
                            Button(action: {
                                infoAction(index: index)
                            }) {
                                Image(infNames[index])
                            }
                            .position(CGPoint(x: 337, y: 217))
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
                        .position(CGPoint(x: 65.0, y: 375.0))
                        .scaleEffect(0.75)
                    Image("betterwhite")
                        .scaleEffect(0.2)
                        .position(CGPoint(x: 104.0, y: 765.0))
                }
                .padding()
            }
            .fadeOutTop()
            
            if showPopup {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showPopup = false
                    }
                
                CustomPopup(title: popupTitle, message: popupMessage) {
                    showPopup = false
                }
            }
        }
    }
    
    func getDestinationView(index: Int) -> some View {
        switch index {
        case 0:
            return AnyView(Project50View())
        case 1:
            return AnyView(Hard75View())
        case 2:
            return AnyView(Betterment30View())
        default:
            return AnyView(EmptyView())
        }
    }
    
    func infoAction(index: Int) {
        switch index {
        case 0:
            popupTitle = "Project 50"
            popupMessage = """
Project50 is a lifestyle challenge made for the top 1% of tomorrow.

If you’re a creative, athlete, entrepreneur, high-performer or if you just want to start living your life to the fullest this is for you
"""
        case 1:
            popupTitle = "75 Hard"
            popupMessage = """
75 HARD is a program that can help change your life. From your way of thinking, to the level of discipline you approach every single task in front of you with. This is about mental toughness.
"""
        case 2:
            popupTitle = "Betterment30"
            popupMessage = """
Betterment30 is a rugged 30 day challenge in which you put yourself through a self betterment journey. If you are looking to live a more disciplined and happy life. This is for you. Get yourself together and be BETTER.
"""
        default:
            break
        }
        showPopup = true
    }
}

struct Project50View: View {
    @Environment(\.presentationMode) var presentationMode // Make sure this is inside the struct
    var body: some View {
        
        ZStack{
            Image("p50thumbnail")
                .position(CGPoint(x: 198.0, y: 56.166))
                .navigationBarBackButtonHidden(true)
            VStack {
                Spacer() // Pushes the button to the bottom
                HStack {
                    Spacer()
                    Button(action: {
                                   presentationMode.wrappedValue.dismiss() // Dismiss the view
                               }) {
                                   HStack {
                                       Image(systemName: "chevron.backward")
                                           .foregroundColor(.yellow)
                                       Text("Back")
                                           .foregroundColor(.yellow)
                                           .font(.headline)
                                   }
                                   .padding()
                                   .background(Color.gray.opacity(0.2))
                                   .cornerRadius(20)
                                   .shadow(radius: 2)
                                   .position(CGPoint(x: 37.0, y: 132.5))
                               }
                               .padding(.trailing) // Padding from the right edge
                }
            }
        }
    }
}

struct Hard75View: View {
    @Environment(\.presentationMode) var presentationMode // Make sure this is inside the struct
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .fill(Color.black)
                    .cornerRadius(35)
                    .frame(height: geometry.size.height / 100)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 3.25)
                    .edgesIgnoringSafeArea(.all)
                Image("75hardthumb")
                    .scaleEffect(0.75)
                    .position(CGPoint(x: 198.0, y: 60))
                    .navigationBarBackButtonHidden(true)
                Text("Hard")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .position(CGPoint(x: 195.5, y: 145))
                    .font(.custom("Fredoka-SemiBold", size: 40))
                VStack {
                    Spacer() // Pushes the button to the bottom
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss() // Dismiss the view
                        }) {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.yellow)
                                Text("Back")
                                    .foregroundColor(.yellow)
                                    .font(.headline)
                            }
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(20)
                            .shadow(radius: 1)
                            .position(CGPoint(x: 40.0, y: 132.0))
                        }
                        .padding(.trailing) // Padding from the right edge
                    }
                }
            }
        }
    }
}

struct Betterment30View: View {
    @Environment(\.presentationMode) var presentationMode // Make sure this is inside the struct
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Image("betterwhite")
                    .scaleEffect(0.4)
                    .position(CGPoint(x: 198.0, y: 80))
                    .navigationBarBackButtonHidden(true)
                
                Rectangle()
                    .fill(Color.black)
                    .cornerRadius(35)
                    .frame(height: geometry.size.height / 100)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 3.175)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer() // Pushes the button to the bottom
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss() // Dismiss the view
                        }) {
                            HStack {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(.yellow)
                                Text("Back")
                                    .foregroundColor(.yellow)
                                    .font(.headline)
                            }
                            .padding(8)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(8)
                            .shadow(radius: 1)
                            .position(CGPoint(x: 39.0, y: 20))
                        }
                    }
                }
            }
        }
    }
}

struct CustomPopup: View {
    let title: String
    let message: String
    var onClose: () -> Void
    
    var body: some View {
        ZStack {
            Color(.yellow)
            VStack(spacing: 20) {
                Text(title)
                    .font(.custom("Fredoka-SemiBold", size: 30))
                Text(message)
                    .font(.custom("Fredoka-Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .padding()
                Button(action: {
                    onClose()
                }) {
                    Text("Close")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .frame(width: 350, height: 375)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .position(CGPoint(x: 201, y: 200))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

extension View {
    func fadeOutTop(fadeLength: CGFloat = 25) -> some View {
        return mask(
            VStack(spacing: 0) {
                
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
