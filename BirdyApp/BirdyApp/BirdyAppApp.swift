//
//  BirdyAppApp.swift
//  BirdyApp
//
//  Created by student on 10.12.2022..
//

import SwiftUI

let IMAGE_URL = URL(string: "https://media.cntraveller.com/photos/611bf0b8f6bd8f17556db5e4/1:1/w_2000,h_2000,c_limit/gettyimages-1146431497.jpg")!

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
                ProfileView()
                    .tabItem({
                        Label("Profile", systemImage: "person.circle")
                    })
            }
            .environmentObject(tweetData)
            .environmentObject(userData)
            .task(tweetData.fetchTweets)
        }
    }
}
