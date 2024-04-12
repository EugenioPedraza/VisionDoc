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
            
            Text("VisionDoc")
                .font(.custom("SF Pro", size: 130))
                .fontWeight(.heavy)
                .padding(.bottom, 500)
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
            QuizMenuView(bodySystems: arrBodySystems[0])
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}


    


#Preview {
    MenuView()
}
