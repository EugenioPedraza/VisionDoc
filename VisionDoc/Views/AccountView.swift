//
//  AccountView.swift
//  VisionDoc
import SwiftUI

struct AccountView: View {
    @State private var name = ""
    @State private var classCode = ""

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Sign In")) {
                    TextField("Name", text: $name)
                    TextField("Class Code", text: $classCode)
                } .fontWeight(.bold)
                
                
                Button(action: {
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity) // Make the button fill the available width
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .glassBackgroundEffect(displayMode: .always)
            }
            .frame(width: 500) // Set a fixed width for the form
            .padding(.horizontal) // Add horizontal padding
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color.clear) // Use a clear background color
        .cornerRadius(20)
    }
}

#Preview {
    AccountView()
}
