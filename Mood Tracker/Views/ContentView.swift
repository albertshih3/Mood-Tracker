//
//  ContentView.swift
//  Mood Tracker
//
//  Created by Kaelin Shih on 12/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home

    enum Tab {
        case home
        case analyze
        case settings
    }

    var body: some View {
        TabView(selection: $selection) {
            HYU_CatHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

            HYU_CatAnalyze()
                .tabItem {
                    Label("Analyze", systemImage: "slider.vertical.3")
                }
                .tag(Tab.analyze)
            HYU_CatSettings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag(Tab.settings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
