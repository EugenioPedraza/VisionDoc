import SwiftUI

struct AccountView: View {
    @State private var name = ""
    @State private var classCode = ""

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Image(systemName: "person.circle" )
                    .font(.system(size: 60))
                Text("Log in")
                    .font(.extraLargeTitle)
                    .bold()
                
                TextField("Name", text: $name)
                    .font(.system(size: 28))
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.vertical, 12)
                    .background(Color(UIColor.systemBackground)) // Adapts to dark/light mode
                    .cornerRadius(8)
                    .shadow(radius: 3)
                
                TextField("Class Code", text: $classCode)
                    .font(.system(size: 28))
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.vertical, 12)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(8)
                    .shadow(radius: 3)
                
                Button(action: {
                    // Perform sign-in action here
                }) {
                    Text("Sign in")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.clear)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .frame(maxWidth: 300, maxHeight: 300)
        .edgesIgnoringSafeArea(.all)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
