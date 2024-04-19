//
//  LogInView.swift
//  YumYard
//
//  Created by Diệu Anh on 4/19/24.
//

import SwiftUI

struct LogInView: View {
    @State private var isAuthenticated = false
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("Log in")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.green)
                
                TextEnter(displayText: "Username", typeText: username)
                TextEnter(displayText: "Password", typeText: password)
                    .padding(.bottom)
                
                Button("Log in") {
                    
                }
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: 160, maxHeight: 60)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding(.bottom, 5)
                
                NavigationLink(destination: LogInView()) {
                    HStack {
                        Text("Don't have an account?")
                            .foregroundStyle(Color.green)
                            .font(.system(size: 18))
                        
                        NavigationLink("SIGN UP", destination: SignUpView())
                                           .font(.system(size: 18, weight: .bold))
                                           .foregroundStyle(Color(.green))
                    }
                }
            }
        }
    }
}

#Preview {
    LogInView()
}

struct TextEnter: View {
    var displayText: String
    @State var typeText: String = ""
    var body: some View {
        if displayText == "Password" {
            SecureField(displayText, text: $typeText)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(color: Color.black.opacity(0.08), radius: 60, y: 16)
        } else {
            TextField(displayText, text: $typeText)
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .shadow(color: Color.black.opacity(0.08), radius: 60, y: 16)
        }
    }
}


