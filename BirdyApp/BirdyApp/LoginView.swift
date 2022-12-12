//
//  LoginView.swift
//  BirdyApp
//
//  Created by student on 10.12.2022..
//

import SwiftUI

struct LoginView: View {
    
    @Binding var username: String
    @Binding var isPresented: Bool
    var body: some View {
        VStack{
            Text("Birdy").font(.title)
            TextField("username", text: $username)
                .multilineTextAlignment(.center)
            
            Button(action: {
                isPresented = false
            }){
                Text("Login")
            }
            
            TextField("username", text: $username)
                .padding(.leading, 100)
                .padding(.trailing, 100)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: Binding.constant(""), isPresented: Binding.constant(true))
    }
}
