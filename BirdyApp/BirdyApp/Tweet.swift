//
//  Tweet.swift
//  BirdyApp
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct TweetModel: Identifiable {
    var id = UUID().uuidString
    
    let content: String
    let username: String
    let date: Date
    let image: String
}

struct Tweet: View {
    
    @Binding var tweet: TweetModel
    @EnvironmentObject var userData : UserData
    
    var body: some View {
        HStack {
            Image(tweet.image)
                .resizable()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack {
                Text(tweet.username)
                Text(tweet.content)
                Text(tweet.date, style: .relative)
            }
            
            Spacer()
            
            Button(action: {
                if userData.favouriteTweets.contains(tweet.id){
                    userData.favouriteTweets.remove(tweet.id)
                } else {
                    userData.favouriteTweets.insert(tweet.id)
                }
            }){
                if userData.favouriteTweets.contains(tweet.id){
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                else{
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct Tweet_Previews: PreviewProvider {
    static var previews: some View {
        Tweet(tweet: Binding.constant(TweetModel(
            content: "Tweet1",
            username: "username",
            date: Date(),
            image: "birds")))
            .environmentObject(UserData())
    }
}
