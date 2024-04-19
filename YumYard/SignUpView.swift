//
//  SignUpView.swift
//  YumYard
//
//  Created by Diệu Anh on 4/19/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Text("Sign up")
                    .fontWeight(.bold)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.green)
                
                CustomTextField(placeHolder: "Full Name", bColor: Color.gray, tOpacity: 0.6, value: name)
                CustomTextField(placeHolder: "Email", bColor: Color.gray, tOpacity: 0.6, value: email)
                CustomTextField(placeHolder: "Username", bColor: Color.gray, tOpacity: 0.6, value: username)
                CustomTextField(placeHolder: "Password", bColor: Color.gray, tOpacity: 0.6, value: password)
                    .padding(.bottom)
                
                Text("Sign up")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding(.bottom, 5)
                
                
                    HStack {
                        Text("Already have an account?")
                            .foregroundStyle(Color.green)
                            .font(.system(size: 18))
                        
                        NavigationLink("LOG IN", destination: LogInView())
                                           .font(.system(size: 18, weight: .bold))
                                           .foregroundStyle(Color(.green))
//                        .navigationDestination(for: String.self) {_ in
//                            LogInView()
//                        }
                        
                        
                    }
                }
            }
        }
        
        
    }


#Preview {
    SignUpView()
}

struct CustomTextField: View {
    var placeHolder: String
    var bColor: Color
    var tOpacity: Double
    @State var value: String
    
    var body: some View {
        HStack {
            if placeHolder == "Password" {
                ZStack (alignment: .leading) {
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundStyle(Color(bColor).opacity(tOpacity))
                            .padding(.leading, 12)
                            .font(.system(size: 20))
                    }
                    
                    SecureField("", text: $value)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                        .frame(height: 45)
                }
            }
            else {
                ZStack (alignment: .leading) {
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundStyle(Color(bColor).opacity(tOpacity))
                            .padding(.leading, 12)
                            .font(.system(size: 20))
                    }
                    
                    TextField("", text: $value)
                        .padding(.leading, 12)
                        .font(.system(size: 20))
                        .frame(height: 45)
                }
            }
        }
        .overlay(
        Divider()
            .overlay(
                Color(bColor).opacity(tOpacity))
            .padding(.horizontal, 10), alignment: .bottom)
    }
}
