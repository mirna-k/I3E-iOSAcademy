//
//  ProfilView.swift
//  BirdyApp
//
//  Created by student on 12.12.2022..
//

import SwiftUI

struct ProfilView: View {
    
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var tweetData : TweetData
    @State var username = ""
    
    var userTweets: [TweetModel]{
        return tweetData.tweets.filter{tweet in
            return tweet.username == userData.username
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                Image("bird2")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                Text(userData.username)
                    .font(.title)
                    .bold()
            }
            List(userTweets) { tweet in
                Tweet(tweet: Binding.constant(tweet))
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
