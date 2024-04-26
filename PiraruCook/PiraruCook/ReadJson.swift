//
//  readJson.swift
//  fjordfairies
//
//  Created by
//

import Foundation


func readLocalJSONFile(forName name: String) -> Data? {
    do {
           if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
               let fileUrl = URL(fileURLWithPath: filePath)
               let data = try Data(contentsOf: fileUrl)
               return data
           }
       } catch {
           print("error: \(error)")
       }
       return nil
}

struct TypeDish: Codable, Hashable {
    let name: String
    let description: String
    let nutritionalInfo: String
    let ingredients: [String]
    let image: String
    let price: Float
    
    static func preview() -> TypeDish {
        TypeDish(name: "", description: "", nutritionalInfo: "", ingredients: [], image: "", price: 0.0)
    }
    
    static let example = TypeDish(name: "teste", description: "", nutritionalInfo: "", ingredients: [], image: "", price: 0.0)
}

struct sampleRecord: Codable {
    let typesDishes: [TypeDish]
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
        let data = readLocalJSONFile(forName: "challenges")
        let sampleData = parse(jsonData: data!)
        
        if let sampleData {
            typeDish = sampleData.typesDishes
            typeDish = getUniqueItems(typeDish)
        }
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

func parse(jsonData: Data) -> sampleRecord? {
    do {
        let decodedData = try JSONDecoder().decode(sampleRecord.self, from: jsonData)
        return decodedData
    } catch {
        print("error: \(error)")
    }
    return nil
}

