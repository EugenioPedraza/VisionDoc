import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            LearnView()
                .tabItem {
                    Label("Learn", systemImage: "book")
                }
            QuizView()
                .tabItem {
                    Label("Quiz", systemImage: "questionmark.circle")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .cornerRadius(20)
        .background {
            Image("menuimage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .cornerRadius(50) // Apply corner radius
                .clipped() // Clip the image to the rounded corners
        }
    }
}

struct LearnView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Body Systems")
                .font(.custom("monospace", size: 60))
                .fontWeight(.bold)
                .padding(.leading, 20)
                .padding(.top)
            systemsMenu3D(bodySystems: arrBodySystems[0])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

struct QuizView: View {
    var body: some View {
        VStack {
            Text("Quiz")
                .font(.custom("monospace", size: 60))
                .fontWeight(.bold)
                .padding(.leading, 20)
                .padding(.top)
            QuizMenuView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

struct AccountView: View {
    @State private var name = ""
    @State private var classCode = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Sign In")) {
                    TextField("Name", text: $name)
                    TextField("Class Code", text: $classCode)
                }
                
                Button(action: {
                    // Perform sign-in action here
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .frame(width: 300) // Set a fixed width for the form
            .padding(.horizontal) // Add horizontal padding
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

#Preview {
    MenuView()
}
