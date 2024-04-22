import SwiftUI
import Firebase

struct AccountView: View {
    @Environment(AuthManager.self) var authManager
    @State private var email: String = ""
    @State private var name: String = ""

    @State private var shouldNavigateToWelcomeView = false

    var body: some View {
        VStack {
            Text("Hello, \(email)!")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Divider()
            
            UserProfileSection()
            
            Spacer()
            
            Button(action: signOut) {
                Text("Sign Out")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            
            // NavigationLink to WelcomeView
            NavigationLink(
                destination: WelcomeView(),
                isActive: $shouldNavigateToWelcomeView
            ) {
                EmptyView()
            }
            .hidden()
        }
        .onAppear {
            fetchUserData()
        }
    }
    
    func fetchUserData() {
        if let user = Auth.auth().currentUser {
            self.email = user.email ?? ""
        }
    }
    
    func signOut() {
        authManager.signOut()
            // Once sign-out is completed, navigate to WelcomeView
        shouldNavigateToWelcomeView = true
    }
}

struct UserProfileSection: View {
    // You can customize the user profile section here
    var body: some View {
        // Add more user profile information here if needed
        Text("User Profile Section")
            .font(.headline)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding()
    }
}

#if DEBUG
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
            .environment(AuthManager())
    }
}
#endif
