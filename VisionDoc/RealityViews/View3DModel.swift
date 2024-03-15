//
//  View3DModel.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 14/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct View3DModel: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var body: some View {
        Button("Show Solar System") {
            Task {
                let result = await openImmersiveSpace(id: "solarSystem")
                if case .error = result {
                    print("An error occurred")
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    View3DModel()
}
