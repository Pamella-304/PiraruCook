import Foundation
import SwiftUI


enum RecordKeysUser: String {
    case type = "user"
    case name
    case birthDate
    case address
    case cpf
    case email
    case password
    case boi
    
}

enum Boi: Codable {
    case garantido
    case caprichoso
}


struct User: Codable {
    
    var userName: String
    var firstName: String
    var lastName: String
    var birthDate: Date
    var address: String
    var email: String
    var password: String
    var cpf: String
 //   var photo: UIImage = UIImage (named: "BolinhoDePiracui") ?? nil
    var boi: Boi
    
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
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
        try container.encode(userName, forKey: .userName)
            try container.encode(firstName, forKey: .firstName)
            try container.encode(lastName, forKey: .lastName)
            try container.encode(birthDate, forKey: .birthDate)
            try container.encode(password, forKey: .password)
            try container.encode(address, forKey: .address)
            try container.encode(email, forKey: .email)
            try container.encode(cpf, forKey: .cpf)
            try container.encode(boi, forKey: .boi)
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

