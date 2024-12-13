import Foundation
import Dispatch

func mixAnswers(correct: String, incorrect: [String]) -> [String] {
    let allAnswers = incorrect + [correct]
    return allAnswers.shuffled()
}

func fetchAndPlay() {
    let urlString = "https://opentdb.com/api.php?amount=10"
    guard let url = URL(string: urlString) else {
        print("URL invalide.")
        exit(EXIT_FAILURE)
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            print("Erreur de chargement des données : \(error?.localizedDescription ?? "inconnue")")
            exit(EXIT_FAILURE)
        }
        
        struct Response: Codable {
            let results: [Question]
        }
        struct Question: Codable {
            let category: String
            let difficulty: String
            let question: String
            let correct_answer: String
            let incorrect_answers: [String]
        }
        
        do {
            let decoded = try JSONDecoder().decode(Response.self, from: data)
            
            for (index, question) in decoded.results.enumerated() {
                print("\nQuestion \(index + 1):")
                print("Catégorie: \(question.category)")
                print("Difficulté: \(question.difficulty)")
                print(question.question)
                
                let answers = mixAnswers(correct: question.correct_answer, incorrect: question.incorrect_answers)
                for (i, answer) in answers.enumerated() {
                    print("\(i + 1). \(answer)")
                }
                
                var userAnswer: Int? = nil
                repeat {
                    print("Votre réponse : ", terminator: "")
                    if let input = readLine(), let choice = Int(input), choice > 0, choice <= answers.count {
                        userAnswer = choice
                    } else {
                        print("Entrée invalide, veuillez réessayer.")
                    }
                } while userAnswer == nil
                
                if answers[userAnswer! - 1] == question.correct_answer {
                    print("Bonne réponse !")
                } else {
                    print("Mauvaise réponse. La bonne réponse était : \(question.correct_answer)")
                }
            }
            
            print("\nMerci d'avoir joué !")
            exit(EXIT_SUCCESS)
        } catch {
            print("Erreur lors du décodage JSON : \(error)")
            exit(EXIT_FAILURE)
        }
    }
    task.resume()
}

DispatchQueue.main.async {
    fetchAndPlay()
}

dispatchMain()



