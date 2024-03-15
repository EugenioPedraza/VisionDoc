//
//  quizView.swift
//  desarrolloVision
//
//  Created by Alumno on 14/03/24.
//

import SwiftUI

struct quizView: View {
    let difficulty: Difficulty
    let selectedAnatomy: BodySystem?
    
        var body: some View {
                VStack(spacing: 20) {
                    Text(selectedAnatomy?.name ?? "Skeletal")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .padding(20)
                    Divider()
                    
                    Text("Choose a difficulty level:")
                        .font(.title)
                    
                    HStack{
                        NavigationLink(destination: quizView(difficulty: .easy, selectedAnatomy: selectedAnatomy)) {
                            DifficultyButton(difficulty: .easy)
                        }
                        
                        NavigationLink(destination: quizView(difficulty: .normal, selectedAnatomy: selectedAnatomy)) {
                            DifficultyButton(difficulty: .normal)
                        }
                        
                        NavigationLink(destination: quizView(difficulty: .advanced, selectedAnatomy: selectedAnatomy)) {
                            DifficultyButton(difficulty: .advanced)
                        }
                    }
                    

                }
                .padding()
        }
    }




