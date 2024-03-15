//
//  ModelButtonTest.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 14/03/24.
//

import SwiftUI

struct ModelButtonTest: View {
    @Environment(\.openWindow) var openWindow
    var body: some View {
        VStack{
            Button("Open Model") {
                openWindow(id: "volumetricWindow")
            }
        }
        .padding()
    }
}

#Preview {
    ModelButtonTest()
}
