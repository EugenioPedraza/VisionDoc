//
//  VisionDocApp.swift
//  VisionDoc
//
//  Created by Eugenio Pedraza on 14/03/24.
//

import SwiftUI
import os
import ARKit
import RealityKitContent

public let logger = Logger()

@main
struct VisionDocApp: App {
    
    private let immersiveSpaceIdentifier = "Immersive"
    @State private var viewModel = ViewModel()
    
    
    init(){
        
    
        
        
        RealityKitContent.PointOfInterestComponent.registerComponent()
        PointOfInterestRuntimeComponent.registerComponent()
        RealityKitContent.BillboardComponent.registerComponent()
        RealityKitContent.GestureComponent.registerComponent()
        PointOfInterestRuntimeComponent.registerComponent()
        
        
        
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        WindowGroup(id: "skeletalModel"){
            SkeletalModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
        
        
        WindowGroup(id: "nervousModel"){
            NervousModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
        WindowGroup(id: "muscularModel"){
            MuscularModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 7, height: 7, depth: 7, in: .meters)
        
        WindowGroup(id: "circulatoryModel"){
            CirculatoryModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
        WindowGroup(id: "respiratoryModel"){
            RespiratoryModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
        
        WindowGroup(id: "urinaryModel"){
            UrinaryModel()
        } .windowStyle(.volumetric)
            .defaultSize(width: 2, height: 2, depth: 2, in: .meters)
        
        
        WindowGroup {
            SecondView(spaceId: immersiveSpaceIdentifier,
                        viewModel: viewModel)
        }
        .windowStyle(.plain)

        ImmersiveSpace(id: immersiveSpaceIdentifier) {
            SkeletonModelView(viewModel: viewModel)
        }

    }
}
        
    
