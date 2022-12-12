//
//  TweetData.swift
//  BirdyApp
//
//  Created by student on 12.12.2022..
//

import Foundation
import Combine

class TweetData: ObservableObject{
    @Published var tweets: [TweetModel] = [
        TweetModel(
            content: "Tweet1",
            username: "username",
            date: Date(),
            image: "birds"
        ),
        TweetModel(
            content: "Tweet 2",
            username: "username",
            date: Date(),
            image: "bird2"
        ),
        TweetModel(
            content: "Tweet 3",
            username: "username",
            date: Date(),
            image: "birds"
        )
    ]
}
