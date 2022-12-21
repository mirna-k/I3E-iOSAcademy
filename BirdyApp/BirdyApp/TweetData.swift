//
//  TweetData.swift
//  BirdyApp
//
//  Created by student on 12.12.2022..
//

import Foundation
import Combine

class TweetData: ObservableObject{
    @Published var tweets: [TweetModel] = []
    
    @MainActor @Sendable	
    func fetchTweets() async {
        do{
            //skiniti JSON
            let url = URL(string: "https://birdy-da9a8-default-rtdb.europe-west1.firebasedatabase.app/tweets.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //dekodirati JSON
            let dekoder = JSONDecoder()
            dekoder.dateDecodingStrategy = .iso8601
            let json = try dekoder.decode([String: TweetModel].self, from: data)
            tweets = [TweetModel](json.values)
            
            //postaviti tweets
        } catch let error{
            print(error)
        }
    }
    
    @MainActor @Sendable
    func sendTweet(tweet: TweetModel) async {
        do{
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let json = try encoder.encode(tweet)
            
            let url = URL(string: "https://birdy-da9a8-default-rtdb.europe-west1.firebasedatabase.app/tweets.json")!
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.httpBody = json
            
            let (_, response) = try await URLSession.shared.data(for: request)
            print(response)
            
        } catch let error{
            print(error)
        }
    }
}

