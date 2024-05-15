import Foundation
import SwiftUI


enum RecordKeysUser: String {
    case userName, firstName, lastName, birthDate
    case address, email, password, cpf
}

enum Boi: Codable {
    case garantido
    case caprichoso
}

//struct UserData: Codable {
//    var userName: String
//    var firstName: String
//    var lastName: String
//    var birthDate: Date
//    var address: String
//    var email: String
//    var password: String
//    var cpf: String
//}
//
//struct UserService: Codable {
//    var userData: UserData?
//    
////    func loggedUser() -> User {
////        // API
////        // User
////    }

//}

enum CodingKeysUser: CodingKey {
    case userName, firstName, lastName, birthDate
    case address, email, password, cpf, boi
}


@Observable
class User: Codable {
    
    var userName: String
    var firstName: String
    var lastName: String
    var birthDate: Date
    var address: String
    var email: String
    var password: String
    var cpf: String
//    var photo: UIImage = UIImage (named: "BolinhoDePiracui") ?? nil
    var boi: Boi?
    

    
    func formatCPF(_ s: String) -> String{
        let start1 = s.index(s.startIndex, offsetBy: 0)
        let end1 = s.index(s.startIndex, offsetBy: 3)
        let range1 = start1..<end1
        
        let start2 = s.index(s.startIndex, offsetBy: 3)
        let end2 = s.index(s.startIndex, offsetBy: 6)
        let range2 = start1..<end1
        
        let start3 = s.index(s.startIndex, offsetBy: 6)
        let end3 = s.index(s.startIndex, offsetBy: 9)
        let range3 = start1..<end1
        
        let start4 = s.index(s.startIndex, offsetBy: 9)
        let end4 = s.index(s.startIndex, offsetBy: 11)
        let range4 = start1..<end1
        
        return("\(s[range1]).\(s[range2]).\(s[range3])-\(s[range4])")
      }
    
    func updateUser(user: User) {
        self.userName = user.userName
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.birthDate = user.birthDate
        self.address = user.address
        self.email = user.email
        self.password = user.password
        self.cpf = user.cpf
        self.boi = user.boi
    }
    
    init(userName: String, firstName: String,lastName: String, birthDate: Date, address: String, email: String, password: String, cpf: String, boi: Boi) {

        self.userName = userName
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.address = address
        self.email = email
        self.password = password
        self.cpf = cpf
        self.boi = boi
      //  self.photo = photo
    }
}

