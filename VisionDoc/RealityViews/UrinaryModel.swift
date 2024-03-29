//
//  UrinaryModel.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 14/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct UrinaryModel: View {
    var body: some View {
        RealityView{ content in
            do {
                let scene =  try await Entity.init(named: "kidney", in: realityKitContentBundle)
                scene.position = SIMD3<Float>(x:0 , y: -0.2, z:0)
                content.add(scene)
            } catch {
                logger.error("\(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    UrinaryModel()
}
