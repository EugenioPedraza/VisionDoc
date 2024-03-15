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
    @State private var style: ImmersionStyle = .mixed
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        ImmersiveSpace(id: "solarSystem") {
            ImmersiveView()
        }
    }
}
