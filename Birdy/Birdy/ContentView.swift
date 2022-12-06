//
//  ContentView.swift
//  Birdy
//
//  Created by student on 06.12.2022..
//

import SwiftUI

struct Bird{
    
    var greeting : String{
        return "Chirp"
    }
    
    func greet(){
        print("Tweet")
    }
}

func Test(){
    let bird = Bird()
    bird.greet()
}

struct ContentView: View {
    
    let tweets: [TweetModel] = [
        TweetModel(
            content: "tweet1",
            username: "Mirna",
            date: Date(),
            image: "cat",
            isFavourite: true
        ),
        TweetModel(
            content: "tweet2",
            username: "Saša",
            date: Date(),
            image: "cat",
            isFavourite: false
        )
    ]
    var body: some View {
        VStack {
            HStack{
                Text("Birdy").font(.title)
                Spacer()
                Button(action: {}){
                    Text("Login")
                }
            }
            Spacer()
            
            List(tweets){
                tweet in
                Tweet(tweet: tweet)
            }.listStyle(.plain)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


