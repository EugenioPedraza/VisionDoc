//
//  NervousModel.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 14/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent


struct NervousModel: View {
    @State private var rotateBy: Double = 0.0
    var body: some View {
        RealityView{ content in
            do {
                let scene =  try await Entity.init(named: "kidneyAnatomy.usda", in: realityKitContentBundle)
                scene.position = SIMD3<Float>(x:0 , y:0, z:0)
                scene.scale *= SIMD3<Float>(repeating:0.1)
                content.add(scene)
            } catch {
                logger.error("\(error.localizedDescription)")
            }
        }
        .rotation3DEffect(.radians(rotateBy), axis: .y)
        .gesture(
            DragGesture(minimumDistance: 0.0)
                .targetedToAnyEntity()
                .onChanged{value in
                    let location3D = value.convert(value.location3D, from: .local, to: .scene)
                    let startLocation = value.convert(value.startLocation3D, from: .local, to: .scene)
                    
                    let delta = location3D - startLocation
                    
                    rotateBy = Double(atan(delta.x * 200))
                }
        )
    }
}

#Preview() {
    NervousModel()
}

