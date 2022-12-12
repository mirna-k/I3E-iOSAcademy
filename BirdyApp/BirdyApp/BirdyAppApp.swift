//
//  BirdyAppApp.swift
//  BirdyApp
//
//  Created by student on 10.12.2022..
//

import SwiftUI

@main
struct BirdyAppApp: App {
    
    @StateObject var tweetData = TweetData()
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        Label("Feed", systemImage: "list.bullet.circle")
                    }
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass.circle")
                    }
                ProfilView()
                    .tabItem({
                        Label("Profil", systemImage: "person.circle")
                    })
            }
            .environmentObject(tweetData)
            .environmentObject(userData)
        }
    }
}
