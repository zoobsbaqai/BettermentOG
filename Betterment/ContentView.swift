//
//  ContentView.swift
//  Betterment
//
//  Created by Zohair Baqai on 2024-08-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Title
                HStack {
                    Text("Betterment")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    // Settings Icon
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
                .padding()

                // Routine Plans Section
                VStack(alignment: .leading) {
                    Text("Routine Plans")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)

                    // Project 50
                    HStack {
                        Text("Project 50")
                            .font(.title3)
                        Spacer()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .navigationBarHidden(true)
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
