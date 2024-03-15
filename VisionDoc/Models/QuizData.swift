// Estructura para representar los datos del cuestionario
struct QuizData: Codable, Hashable {
    var name: String
    var id: Int
    var modelName: String
    var description: String
    var difficulty: QuizDifficulty

    // Método de hash para conformar a Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
        hasher.combine(modelName)
        hasher.combine(description)
        hasher.combine(difficulty)
    }
}

// Estructura para representar la dificultad del cuestionario
struct QuizDifficulty: Codable, Hashable {
    var easy: QuizInfo
    var normal: QuizInfo
    var advanced: QuizInfo
}

// Estructura para representar la información del cuestionario
struct QuizInfo: Codable, Hashable {
    var questions: [Question]

    // Método de equidad para conformar a Equatable
    static func ==(lhs: QuizInfo, rhs: QuizInfo) -> Bool {
        return lhs.questions == rhs.questions
    }
}

// Estructura para representar las preguntas del cuestionario
struct Question: Codable, Hashable {
    var question: String
    var answers: [String]
    var correctAnswerIndex: Int
}
