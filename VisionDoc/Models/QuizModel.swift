//
//  QuizModel.swift
//  desarrolloVision
//
//  Created by Alumno on 14/03/24.
//

import Foundation

// Función para cargar los datos del quiz desde el archivo JSON
func loadQuizData() -> [QuizData] {
    let filename = "Quiz.json"
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        let quizData = try decoder.decode([QuizData].self, from: data)
        return quizData
    } catch {
        fatalError("Couldn't parse \(filename) as [QuizData]:\n\(error)")
    }
}

// Cargar los datos del quiz
var arrQuiz: [QuizData] = loadQuizData()
