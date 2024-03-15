//
//  DifficultyButton.swift
//  desarrolloVision
//
//  Created by Alumno on 14/03/24.
//

import SwiftUI

struct DifficultyButton: View {
    let difficulty: Difficulty
    
    var body: some View {
        Text(difficulty.rawValue)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .cornerRadius(10)
    }
}

