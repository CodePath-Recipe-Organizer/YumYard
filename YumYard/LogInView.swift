//
//  LogInView.swift
//  YumYard
//
//  Created by Diệu Anh on 4/19/24.
//

import SwiftUI

struct LogInView: View {
    
    @Environment(AuthManager.self) var authManager
    
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("Log in")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.green)
                
                TextField("Email Address", text: $email)
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: Color.black.opacity(0.08), radius: 60, y: 16)
                SecureField("Password", text: $password)
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(color: Color.black.opacity(0.08), radius: 60, y: 16)
                
                    .padding(.bottom)
                
                Button("Log in") {
                    print("Login user: \(email), \(password)")
                    
                    authManager.signIn(email: email, password: password)
                    
                    if authManager.user != nil {
                        print("Hello")
                    }
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
            .environment(AuthManager())
}



