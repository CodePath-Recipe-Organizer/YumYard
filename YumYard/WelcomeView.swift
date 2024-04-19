//
//  WelcomeView.swift
//  YumYard
//
//  Created by Diệu Anh on 4/19/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BgColor").ignoresSafeArea(edges: .all)
                VStack {
                    Text("YumYard")
                        .fontWeight(.bold)
                        .font(.system(size: 60))
                        .foregroundStyle(Color.green)
                    NavigationLink("Log in", destination: LogInView())
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .padding(.bottom, 5)
                
                NavigationLink("Sign up", destination: SignUpView())
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundStyle(.green)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .padding(.bottom, 5)
            }
                }
                .padding()
            }
        }
}

#Preview {
    WelcomeView()
}


