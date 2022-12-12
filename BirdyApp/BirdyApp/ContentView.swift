//
//  ContentView.swift
//  BirdyApp
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var tweetData: TweetData
    @EnvironmentObject var userData: UserData
    
    @State var content: String = ""
    @State var isLoginViewPresented = false
        
    var body: some View {
        VStack {
            HStack {
                Text(userData.username.isEmpty ? "Title": userData.username).font(.title).bold()
                Spacer()
                Button(action: {isLoginViewPresented = true} ) {
                    Text("Login")
                }
            }
            Spacer()
            List($tweetData.tweets){
                tweet in Tweet(tweet: tweet)
            }
            .listStyle(.plain)
            Spacer()
            HStack{
                
                TextField("Content", text: $content)
                
                Button(action: {
                    tweetData.tweets.append(TweetModel(
                        content: content,
                        username: userData.username,
                        date: Date(),
                        image: "bird2"))
                    content = ""
                }){
                    Text("New Tweet")
                }
                .disabled(content.isEmpty)
            }
        }
        .padding()
        .sheet(isPresented: $isLoginViewPresented, content: {
            LoginView(username: $userData.username, isPresented: $isLoginViewPresented)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TweetData())
            .environmentObject(UserData())
    }
}
