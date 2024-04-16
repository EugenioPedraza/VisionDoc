import SwiftUI

struct AccountView: View {
    @State private var name = ""
    @State private var studentID = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var errorMessage = ""
    @State private var isSuccess = false
    @State private var message = ""
    
    var body: some View {
        VStack (spacing: 10) {
            VStack(spacing: 20) {
                Image(systemName: "person.circle")
                    .font(.system(size: 60))
                
                Text("Log in")
                    .font(.extraLargeTitle)
                    .bold()
                
                TextField("Name", text: $name)
                    .font(.system(size: 28))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .frame(maxWidth: 300, maxHeight: 50)
                
                TextField("Student ID", text: $studentID)
                    .font(.system(size: 28))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .frame(maxWidth: 300, maxHeight: 50)
                
                SecureField("Password", text: $password)
                    .font(.system(size: 28))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(radius: 3)
                    .frame(maxWidth: 300, maxHeight: 50)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                if isLoading {
                    ProgressView()
                } else {
                    HStack {
                        Button("Sign in", action: loginUser)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 200)
                            .cornerRadius(10)
                        
                        Button("Register") {
                            registerUser(name: name, studentID: studentID, password: password) { success, responseMessage in
                                self.isSuccess = success
                                self.message = responseMessage
                            }
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 200)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .edgesIgnoringSafeArea(.all)
        .padding()
    }
    
    func loginUser() {
        isLoading = true
        errorMessage = ""
        let url = URL(string: "http://localhost:3000/users/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["student_id": studentID, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                guard let data = data, error == nil else {
                    self.errorMessage = error?.localizedDescription ?? "Unknown error"
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    do {
                        let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                        UserDefaults.standard.set(loginResponse.user.id, forKey: "userId")
                        UserDefaults.standard.set(loginResponse.user.name, forKey: "userName")
                        UserDefaults.standard.set(loginResponse.user.studentID, forKey: "userStudentID")
                        
                        print("User logged in:", loginResponse.user)
                        // Navigate or update UI as needed
                    } catch {
                        self.errorMessage = "JSON parsing error: \(error)"
                    }
                } else {
                    self.errorMessage = "Invalid credentials or server error"
                }
            }
        }.resume()
    }
}

func registerUser(name: String, studentID: String, password: String, completion: @escaping (Bool, String) -> Void) {
    let url = URL(string: "http://localhost:3000/users/register")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: Any] = [
        "name": name,
        "student_id": studentID,
        "password": password
    ]
    
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        DispatchQueue.main.async {
            guard let data = data, error == nil else {
                completion(false, error?.localizedDescription ?? "Unknown error")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 201 {
                    completion(true, "User registered successfully.")
                    print("Registrado exitosamente")
                    
                    //Poner bien que hacer despues del register
                } else {
                    let errorMessage = String(data: data, encoding: .utf8) ?? "Failed to register"
                    completion(false, errorMessage)
                }
            } else {
                completion(false, "Invalid server response")
            }
        }
    }.resume()
}

struct LoginResponse: Codable {
    let message: String
    let user: User
}

struct User: Codable {
    let id: Int
    let name: String
    let studentID: String
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
