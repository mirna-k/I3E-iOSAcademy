//
//  SearchView.swift
//  BirdyApp
//
//  Created by student on 12.12.2022..
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var tweetData: TweetData
    
    @State var query: String = ""
    var foundTweets: [TweetModel]{
        return tweetData.tweets.filter({ tweet in
            return tweet.content.lowercased().contains(query.lowercased())
        })
    }
    
    var body: some View {
        VStack{
            TextField("Seach", text: $query)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            List(foundTweets) { tweetModel in
                Tweet(tweet:
                        Binding.constant(tweetModel))
            }
            .listStyle(.inset)
            Spacer()
        }.padding(10)
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(TweetData())
    }
}
