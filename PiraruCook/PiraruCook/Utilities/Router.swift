//
//  Router.swift
//  PiraruCook
//
//  Created by Gabriel Leite on 26/04/24.
//

import Foundation

@Observable
class Router: ObservableObject {
    var path: [RouterData]
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

    case Menu, DishDetails, Payment, PaymentDone, SignInForms, LoggedProfile
    //cases para o profile logado
    case PreviousOrders, Addresses, EventInfo, PaymentMethods, Configuration

}

class RouterData: Hashable {
    
    let screen: Views
    let dish: TypeDish?
    
    init(screen: Views, dish: TypeDish? = nil) {
        self.screen = screen
        self.dish = dish
    }
    
    static func == (lhs: RouterData, rhs: RouterData) -> Bool {
        lhs.screen == rhs.screen
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(screen)
    }
}
