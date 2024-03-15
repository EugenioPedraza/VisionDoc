//
//  MenuView.swift
//  desarrolloVision
//
//  Created by D Cantu on 01/03/24.
//

import SwiftUI


struct MenuView: View {
    var body: some View {
        VStack{
                Text("Welcome to VisionDoc")
                    .monospaced()
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 250)
                
                HStack(spacing: 25){
                    ForEach(MenuOptions.allCases) { area in
                        NavigationLink {
                            Text(area.title)
                                .monospaced()
                                .font(.system(size: 40, weight: .bold))
                            if area == MenuOptions.about {
                            }
                            
                            if area == MenuOptions.learn {
                                systemsMenu3D(bodySystems: arrBodySystems[0])
                                
                            }
                            if area == MenuOptions.quiz {
                                QuizMenuView(bodySystems: arrBodySystems[0])
                            }
                            
                            
                        } label: {
                            Label(area.name, systemImage: "chevron.right")
                                .monospaced()
                                .font(.title)
                        }
                        .controlSize(.extraLarge)
                }
            }
        }
            .background()
            {
                SceneKitModelView(modelName: "doctor.obj", rotationAngle: 0)
            }
    }
}

#Preview {
    MenuView()
}



