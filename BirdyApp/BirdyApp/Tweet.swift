//
//  Tweet.swift
//  BirdyApp
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct TweetModel: Identifiable, Codable {
    var id = UUID().uuidString
    
    let content: String
    let username: String
    let date: Date
    let imageURL: URL
}

struct Tweet: View {
    
    @Binding var tweet: TweetModel
    @EnvironmentObject var userData : UserData
    
    @State var image: UIImage? = nil
    
    var body: some View {
        HStack {
            if let image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
            } else {
                Circle()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.gray)
            }
            
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
                        .foregroundColor(.pink)
                        .padding(.trailing, 5)
                }
                else{
                    Image(systemName: "heart")
                        .foregroundColor(.pink)
                        .padding(.trailing, 5)
                }
            }
        }
        .task {
            do{
                let (data, _) = try await URLSession.shared.data(from: IMAGE_URL)
                image = UIImage(data: data)
            } catch let error{
                print(error)
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
            imageURL: IMAGE_URL)))
            .environmentObject(UserData())
    }
}
