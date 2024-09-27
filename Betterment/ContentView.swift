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
                        .frame(width: geometry.size.width * 1, height: geometry.size.height / 2.5)
                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.075)
                        .edgesIgnoringSafeArea(.all)
                    
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .font(.title)
                            .foregroundColor(.yellow)
                            .position(x: geometry.size.width / 1.125, y: geometry.size.height * 0.05)
                    }
                    
                    RoutPlanScroll()
                        .position(x: geometry.size.width / 2.06, y: geometry.size.height * 0.8)
                    
                    Text("Routine Plans")
                        .font(.custom("Fredoka-SemiBold", size: 36))
                        .position(x: geometry.size.width / 3.15, y: geometry.size.height * 0.26)
                    
                    HStack(spacing: 0) {
                        Text("Better")
                            .foregroundStyle(.yellow)
                            .font(.custom("Fredoka-SemiBold", size: 56))
                        
                        Text("ment")
                            .foregroundStyle(.white)
                            .font(.custom("Fredoka-SemiBold", size: 56))
                    }
                    .position(x: geometry.size.width / 2.3, y: geometry.size.height * 0.075)
                    
                    VStack {
                        Text("\"one day or day one?\"")
                            .foregroundStyle(.white)
                            .font(.custom("Fredoka-SemiBold", size: 35))
                            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.14)
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
                    .cornerRadius(25)
                    .frame(width: geometry.size.width * 1, height: geometry.size.height / 2.5)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.075)
                    .edgesIgnoringSafeArea(.all)
                
                Text("Settings")
                    .font(.custom("Fredoka-SemiBold", size: 56))
                    .foregroundStyle(.white)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.075)
                
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
        GeometryReader { geometry in
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
                            .position(x: geometry.size.width / 5.5  , y: geometry.size.height * 0.345)
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
                            .position(x: geometry.size.width / 1.2  , y: geometry.size.height * 0.29)
                            Spacer()
                                .frame(height: 230)
                        }
                        Spacer()
                            .frame(height: 190)
                    }
                    Text("Project 50")
                        .font(.custom("Fredoka-SemiBold", size: 28))
                        .foregroundStyle(.black)
                        .position(x: geometry.size.width / 4.45  , y: geometry.size.height * 0.285)
                    Text("75 Hard")
                        .font(.custom("Fredoka-SemiBold", size: 28))
                        .foregroundStyle(.black)
                        .position(x: geometry.size.width / 5.25  , y: geometry.size.height * 0.702)
                    Text("Betterment30")
                        .font(.custom("Fredoka-SemiBold", size: 28))
                        .foregroundStyle(.black)
                        .position(x: geometry.size.width / 3.5 , y: geometry.size.height * 1.1575)
                    Image("p50thumbnail")
                        .position(x: geometry.size.width / 2.17, y: geometry.size.height * 0.0001)
                        .scaleEffect(0.825)
                    Image("75hardthumb")
                        .position(x: geometry.size.width / 5, y: geometry.size.height * 0.51)
                        .scaleEffect(0.8)
                    Image("betterwhite")
                        .scaleEffect(0.2)
                        .position(x: geometry.size.width / 3.75, y: geometry.size.height * 1.01)

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
    @State private var selectedOption = "7:00AM"
    @State private var goal = ""
    @State private var selectedTime: Double = 45
    @State private var book = ""
    @State private var skill = ""
    
    @Environment(\.presentationMode) var presentationMode
    let times = ["6:00AM", "6:30AM", "7:00AM", "7:30AM", "8:00AM"]
    
    // Check if data exists and navigate accordingly
    @State private var isDataSaved = false
    
    var body: some View {
        NavigationView {
            if isDataSaved {
                // Navigate to p50Regiment directly if data exists
                p50Regiment(goal: goal, selectedOption: selectedOption, selectedTime: selectedTime, book: book, skill: skill)
            } else {
                ZStack {
                    VStack {
                        Image("p50thumbnail")
                            .position(CGPoint(x: 198.0, y: 56.166))
                    }
                    VStack {
                        Text("What is your main goal for this regiment?")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                        TextField("Your Goal", text: $goal)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .padding(.horizontal, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2.5)
                                    .stroke(Color.gray, lineWidth: 1.0)
                            )
                            .padding(.horizontal, 15)
                            .padding(.bottom, 250)
                    }
                    .padding(.bottom, 110)
                    
                    VStack {
                        Text("Select a time for an alarm")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                        
                        Picker("Select an option", selection: $selectedOption) {
                            ForEach(times, id: \.self) { option in
                                Text(option)
                            }
                        }
                        .padding(.horizontal, 20)
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 100)
                    }
                    .padding(.bottom, 125)
                    
                    VStack {
                        Text("Select how long you can exercise daily")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                        Text("Minutes: \(selectedTime, specifier: "%.0f")")
                        Slider(value: $selectedTime, in: 45...90, step: 5)
                            .padding(.bottom, 1)
                            .padding(.horizontal, 20)
                            .accentColor(.yellow)
                    }
                    .padding(.top, 100)
                    
                    VStack {
                        Text("What is a book you'd like to read?")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                        TextField("Your Book", text: $book)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .padding(.horizontal, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2.5)
                                    .stroke(Color.gray, lineWidth: 1.0)
                            )
                            .padding(.horizontal, 15)
                    }
                    .padding(.top, 275)
                    
                    VStack {
                        Text("What is a skill you'd like to learn?")
                            .font(.custom("Fredoka-SemiBold", size: 20))
                        TextField("Your Skill", text: $skill)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                            .padding(.horizontal, 5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2.5)
                                    .stroke(Color.gray, lineWidth: 1.0)
                            )
                            .padding(.horizontal, 15)
                    }
                    .padding(.top, 430)
                    
                    VStack {
                        HStack {
                            Button(action: {
                                // Save data to UserDefaults
                                saveData()
                                isDataSaved = true
                            }) {
                                HStack {
                                    Text("Confirm")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                }
                                .padding(10)
                                .background(Color.yellow)
                                .cornerRadius(20)
                                .shadow(radius: 2)
                                Spacer()
                            }
                            .padding(.horizontal, 140.4625)
                        }
                        .padding(.top, 755)
                    }
                }
                .onAppear {
                    loadData() // Load data when the view appears
                }
            }
        }
    }
    
    // Save user data to UserDefaults
    private func saveData() {
        UserDefaults.standard.set(goal, forKey: "goal")
        UserDefaults.standard.set(selectedOption, forKey: "selectedOption")
        UserDefaults.standard.set(selectedTime, forKey: "selectedTime")
        UserDefaults.standard.set(book, forKey: "book")
        UserDefaults.standard.set(skill, forKey: "skill")
    }
    
    // Load user data from UserDefaults
    private func loadData() {
        if let savedGoal = UserDefaults.standard.string(forKey: "goal") {
            goal = savedGoal
            selectedOption = UserDefaults.standard.string(forKey: "selectedOption") ?? "7:00AM"
            selectedTime = UserDefaults.standard.double(forKey: "selectedTime")
            book = UserDefaults.standard.string(forKey: "book") ?? ""
            skill = UserDefaults.standard.string(forKey: "skill") ?? ""
            isDataSaved = true
        }
    }
}


struct Hard75View: View {
    @Environment(\.presentationMode) var presentationMode // Make sure this is inside the struct
    @State private var selectedOption = "7:00AM"
    @State private var goal = ""
    @State private var selectedTime: Double = 45
    @State private var book = ""
    @State private var skill = ""
    let times = ["6:00AM", "6:30AM", "7:00AM", "7:30AM", "8:00AM"]
    
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
                            Spacer()
                        }
                        .padding(.trailing) // Padding from the right edge
                    }
                    .padding(.bottom, 500)
                }
                VStack {
                    Text("What is your main goal for this regiment?")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    TextField("Your Goal", text: $goal)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2.5)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .padding(.horizontal, 15)
                        .padding(.bottom, 200)
                }
                .padding(.bottom, 110)
                VStack{
                    Text("Select a time for an alarm")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(times, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .padding(.horizontal, 20)
                    .pickerStyle(WheelPickerStyle()) // You can change the style here
                    .frame(height: 100)
                    
                }
                .padding(.bottom, 100)
                
                VStack{
                    Text("Select how long you can excercise daily")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    Text("Minutes: \(selectedTime, specifier: "%.0f")")
                    Slider(value: $selectedTime, in: 45...90, step: 5)
                        .padding(.bottom, 1)
                        .padding(.horizontal, 20)
                        .accentColor(.yellow)
                }
                .padding(.top, 150)
                VStack{
                    Text("What is a book you'd like to read?")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    TextField("Your Book", text: $book)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2.5)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .padding(.horizontal, 15)
                }
                .padding(.top, 315)
                VStack{
                    Text("What is a skill you'd like to learn?")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    TextField("Your Book", text: $skill)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2.5)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .padding(.horizontal, 15)
                }
                .padding(.top, 475)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) {
                            HStack {
                                Text("Confirm")
                                    .foregroundColor(.black)
                                    .font(.headline)
                            }
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            Spacer()
                        }
                        .padding(.horizontal, 140.4625) // Padding from the right edge
                    }
                    .padding(.top, 700)
                }
            }
        }
    }
}

struct Betterment30View: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedOption = "7:00AM"
    @State private var goal = ""
    @State private var selectedTime: Double = 45
    @State private var book = ""
    @State private var skill = ""
    let times = ["6:00AM", "6:30AM", "7:00AM", "7:30AM", "8:00AM"]
    
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
                            Spacer()
                        }
                        .padding(.trailing) // Padding from the right edge
                    }
                    .padding(.bottom, 500)
                }
                VStack {
                    Text("What is your main goal for this regiment?")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    TextField("Your Goal", text: $goal)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2.5)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .padding(.horizontal, 15)
                        .padding(.bottom, 200)
                }
                .padding(.bottom, 110)
                VStack{
                    Text("Select a time for an alarm")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    
                    Picker("Select an option", selection: $selectedOption) {
                        ForEach(times, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .padding(.horizontal, 20)
                    .pickerStyle(WheelPickerStyle()) // You can change the style here
                    .frame(height: 100)
                    
                }
                .padding(.bottom, 100)
                
                VStack{
                    Text("Select how long you can excercise daily")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    Text("Minutes: \(selectedTime, specifier: "%.0f")")
                    Slider(value: $selectedTime, in: 45...90, step: 5)
                        .padding(.bottom, 1)
                        .padding(.horizontal, 20)
                        .accentColor(.yellow)
                }
                .padding(.top, 150)
                VStack{
                    Text("What is a book you'd like to read?")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    TextField("Your Book", text: $book)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2.5)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .padding(.horizontal, 15)
                }
                .padding(.top, 315)
                VStack{
                    Text("What is a skill you'd like to learn?")
                        .font(.custom("Fredoka-SemiBold", size: 20))
                    TextField("Your Book", text: $skill)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2.5)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .padding(.horizontal, 15)
                }
                .padding(.top, 475)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                        }) {
                            HStack {
                                Text("Confirm")
                                    .foregroundColor(.black)
                                    .font(.headline)
                            }
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                            .shadow(radius: 2)
                            Spacer()
                        }
                        .padding(.horizontal, 140.4625) // Padding from the right edge
                    }
                    .padding(.top, 700)
                }
            }
        }
    }
}

struct p50Regiment: View {
    var goal: String
    var selectedOption: String
    var selectedTime: Double
    var book: String
    var skill: String
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemGray2), Color(UIColor.darkGray)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            Text("Project50")
                .font(.custom("Fredoka-SemiBold", size: 40))
                .navigationBarBackButtonHidden()
                .padding(.bottom, 700)
            VStack{
                Text("Regiment Details")
                    .font(.largeTitle)
                    .padding()
                
                Text("Goal: \(goal)")
                    .font(.headline)
                    .padding()
                
                Text("Alarm Time: \(selectedOption)")
                    .font(.headline)
                    .padding()
                
                Text("Exercise Duration: \(Int(selectedTime)) minutes")
                    .font(.headline)
                    .padding()
                
                Text("Book: \(book)")
                    .font(.headline)
                    .padding()
                
                Text("Skill: \(skill)")
                    .font(.headline)
                    .padding()
            }
        }
    }
}

struct CustomPopup: View {
    let title: String
    let message: String
    var onClose: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            
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
            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.3)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
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
