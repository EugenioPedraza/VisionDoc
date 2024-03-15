//
//  3DModelView.swift
//  desarrolloVision
//
//  Created by Eugenio Pedraza on 13/03/24.
//

import Foundation
import SwiftUI
import RealityKit
import RealityKitContent

struct ObjModelView: View {
    
    var body: some View {
        RealityView { content in
            do {
                if let sceneEntity = try? await ModelEntity(named: "kidney") {
                    content.add(sceneEntity)
                    
                }
            } catch {
                logger.error("\(error.localizedDescription)")
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ObjModelView()
}
