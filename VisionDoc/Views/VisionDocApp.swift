//
//  VisionDocApp.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 14/03/24.
//

import SwiftUI
import os
import ARKit


public let logger = Logger()

@main
struct VisionDocApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        WindowGroup(id: "volumetricWindow"){
            View3DModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
    }
}
