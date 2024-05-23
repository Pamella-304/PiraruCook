import Foundation

@Observable
class Router: ObservableObject {
    var path: [RouterData]
    
    init() {
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
    // cases para o profile logado
    case PreviousOrders, Addresses, EventInfo, PaymentMethods, Configuration, TrackOrder
}

class RouterData: Hashable {
    
    let screen: Views
    let dish: TypeDish?
    let method: PaymentMethods?
    
    init(screen: Views, dish: TypeDish? = nil, method: PaymentMethods? = nil) {
        self.screen = screen
        self.dish = dish
        self.method = method
    }
    
    static func == (lhs: RouterData, rhs: RouterData) -> Bool {
        lhs.screen == rhs.screen && lhs.method == rhs.method
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(screen)
        hasher.combine(method)
    }
}

