//
//  UserData.swift
//  BirdyApp
//
//  Created by student on 12.12.2022..
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var username: String = ""
    @Published var image: String = ""
    @Published var favouriteTweets: Set<String> = []
}
