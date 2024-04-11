//
//  AccountView.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 11/04/24.
//

import SwiftUI

struct AccountViewz: View {
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
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .frame(width: 500) // Set a fixed width for the form
            .padding(.horizontal) // Add horizontal padding
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .cornerRadius(20)
        .glassBackgroundEffect()
    }
}

#Preview {
    AccountView()
}
