//
//  Router.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

class Router: ObservableObject {
    @Published var path: [RouterMenuData]
    init(){
        self.path = []
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func goToRoot() {
        path = []
    }
}

enum Views {
    case Menu, DishDetails
}

class RouterMenuData: Hashable {
    
    let screen: Views
    let dish: TypeDish?
    
    init(screen: Views, dish: TypeDish? = nil) {
        self.screen = screen
        self.dish = dish
    }
    
    static func == (lhs: RouterMenuData, rhs: RouterMenuData) -> Bool {
        lhs.screen == rhs.screen
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(screen)
    }
}
