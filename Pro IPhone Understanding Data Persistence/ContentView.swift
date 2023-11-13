//
//  ContentView.swift
//  Pro IPhone Understanding Data Persistence
//
//  Created by Eddington, Nick on 11/1/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $isDarkMode)
                .onChange(of: isDarkMode) { oldMode, newMode in
                    UserDefaults.standard.set(newMode, forKey: "isDarkMode")
                }
                .padding()
            NavigationLink(destination: ItemListView()) {
                Text("Manage Items")
            }
            
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}



#Preview {
    ContentView()
}
