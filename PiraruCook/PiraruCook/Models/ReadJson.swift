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
    
    static func preview() -> TypeDish {
        TypeDish(name: "", description: "", image: "", nutritionalInfo: [], ingredients: [], price: 0.0, tipo: "bebiba")
    }
    
    static let example = TypeDish(name: "Tacaca", description: "Lorem ipsum dolor sit amet", image: "Tacaca", nutritionalInfo: ["alergia","vegano","gluten-free"], ingredients: ["bacuri","cerveja","Suco","Suco","cerveja"], price: 19.99, tipo: "bebiba")

}

struct Dishes: Codable {
     let typeDishes: [TypeDish]
}

class TypeDishesListViewModel: ObservableObject {
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
                print("error:\(error)")
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
    
}



