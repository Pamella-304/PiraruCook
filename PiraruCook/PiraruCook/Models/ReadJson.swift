//
//  readJson.swift
//  fjordfairies
//
//  Created by
//

import Foundation




struct TypeDish: Codable, Hashable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let image: String
    let nutritionalInfo: [String]
    let ingredients: [String]
    let price: Double
    let tipo: String
    var comment: String
    
    static func preview() -> TypeDish {
        TypeDish(name: "", description: "", image: "", nutritionalInfo: [], ingredients: [], price: 0.0, tipo: "bebiba", comment: "Sem gelo")
    }
    
    static let example = TypeDish(name: "Tacaca", description: "Lorem ipsum dolor sit amet", image: "Tacaca", nutritionalInfo: ["alergia","vegano","gluten-free"], ingredients: ["bacuri","cerveja","Suco","Suco","cerveja"], price: 19.99, tipo: "bebiba", comment: "Sem sal")
    
    static let exampleBebida = TypeDish(name: "Suco de laranha", description: "Suco de laranja fresca, feito na hora", image: "Suco", nutritionalInfo: [], ingredients: ["Laranja"], price: 6.99, tipo: "Bebidas", comment: "Sem açúcar")

    mutating func updateComment(_ comment :String) {
        self.comment = comment
    }

}

struct Dishes: Codable {
    let typeDishes: [TypeDish]
}

class TypeDishesListViewModel: ObservableObject, Sequence {
    
    @Published var typeDish = [TypeDish]()
    @Published var searchText: String = ""
    
    var filteredTypeDishes: [TypeDish] {
        guard !searchText.isEmpty else { return typeDish }
        let suggestions = typeDish.filter { typeDish in
            typeDish.name.lowercased().contains(searchText.lowercased())
        }
        
        return suggestions
    }
    
    init() {
        let data = readLocalJSONFile(filename: "Receitas")
        let sampleData = data?.typeDishes
        
        if sampleData != nil {
            typeDish = getUniqueItems(sampleData!)
        }
    }
    
    func readLocalJSONFile(filename fileName: String) -> Dishes? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Dishes.self, from: data)
                return jsonData
            } catch {
              //  print("error:\(error)")
            }
        }
        return nil
        
    }
    
    
    func getUniqueItems(_ arr: [TypeDish]) -> [TypeDish] {
        var uniqueItems = [TypeDish]()
        
        for item in arr {
            if !uniqueItems.contains(where: {$0.name == item.name}) {
                uniqueItems.append(item)
            }
        }
        
        uniqueItems = uniqueItems.sorted { $0.name < $1.name }
        return uniqueItems
    }
    
    // Implementação do protocolo Sequence
    func makeIterator() -> AnyIterator<TypeDish> {
        var index = 0
        return AnyIterator {
            guard index < self.typeDish.count else { return nil }
            let element = self.typeDish[index]
            index += 1
            return element
        }
    }
    
}



