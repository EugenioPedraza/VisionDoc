//
//  systemsMenu3D.swift
//  desarrolloVision
//
//  Created by Eugenio Pedraza on 28/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct systemsMenu3D: View {
    
    var bodySystems: BodySystem
    @State private var selectedAnatomy: BodySystem?
    @State private var bounce = false
    @State private var rotationAngle: CGFloat = 0
    @State var showModel: Bool = false
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        
        Text("Body Systems")
            .font(.system(size: 70))
            .fontWeight(.bold)

        Divider()
            HStack{
                NavigationSplitView{
                    ScrollView{
                        ForEach(arrBodySystems) {bodySystem in
                            BodyRow(bodySystem: bodySystem, onSelect: {selectedSystem in
                                self.selectedAnatomy = selectedSystem})
                        }
                    }

                } detail: {
                    VStack(alignment: .leading){
                        if let selectedAnatomy = selectedAnatomy {
                            Text(selectedAnatomy.name)
                                .font(.system(size: 40))
                                .fontWeight(.light)
                                .padding(15)
                            Divider()
                            Text(selectedAnatomy.description)
                                .padding(25)
                                .font(.system(size: 30))
                            Button(action: {
                                self.showModel.toggle()
                                openWindow(id: "volumetricWindow")
                            }) {
                                Text("> Display Model")
                                    .monospaced()
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(20)
                            
                        } else {
                            Text("Choose an Anatomy System")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                                .padding(15)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding()
                }
        }
        
    }
    
}
    

#Preview(){
        systemsMenu3D(bodySystems: arrBodySystems[1])
}
