import SwiftUI

struct UserProfileView: View {
    @State private var userInfo: UserInfo?
    @State private var quizResults: [QuizResult] = []
    @State private var isLoading = false
    @State private var errorMessage = ""

    var body: some View {
        ScrollView {
            VStack {
                if isLoading {
                    ProgressView()
                } else if let userInfo = userInfo {
                    userInfoView(userInfo)
                    Divider()
                    quizResultsView(quizResults)
                } else {
                    Text("Failed to load user info: \(errorMessage)")
                        .foregroundColor(.red)
                }
            }
            .padding()
            .onAppear {
                loadUserProfile()
            }
        }
        .navigationBarTitle("User Profile", displayMode: .inline)
    }
    
    private func userInfoView(_ userInfo: UserInfo) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(userInfo.name)")
                .font(.title)
            Text("Student ID: \(userInfo.studentId)")
                .font(.headline)
        }
    }
    
    private func quizResultsView(_ results: [QuizResult]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Quiz Results")
                .font(.title2)
            ForEach(results) { result in
                Text("\(result.quizName): \(result.score)/\(result.totalQuestions)")
            }
        }
    }
    
    private func loadUserProfile() {
        isLoading = true
        let userId = "your_user_id"  // Replace with actual user ID logic
        guard let url = URL(string: "http://localhost:3000/users/profile/\(userId)") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    self.errorMessage = "Failed to fetch data"
                    return
                }
                
                do {
                    let userProfile = try JSONDecoder().decode(UserProfile.self, from: data)
                    self.userInfo = userProfile.userInfo
                    self.quizResults = userProfile.quizResults
                } catch {
                    self.errorMessage = "Failed to decode user profile"
                }
            }
        }.resume()
    }
}

struct UserInfo: Codable, Identifiable {
    var id: String
    var name: String
    var studentId: String
}

struct QuizResult: Codable, Identifiable {
    var id: Int
    var quizName: String
    var score: Int
    var totalQuestions: Int
}

struct UserProfile: Codable {
    var userInfo: UserInfo
    var quizResults: [QuizResult]
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
