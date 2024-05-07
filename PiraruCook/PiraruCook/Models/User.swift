import Foundation


enum RecordKeysUser: String {
    case type = "user"
    case name
    case birthDate
    case userID
    case address
    case cpf
    case email
    case boi
    
}

enum Boi {
    case garantido
    case caprichoso
}


struct User {
    var name: String
    var birthDate: Date
    var userID: String
    var address: String
    var email: String
    var cpf: String
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
    
    
    init(name: String, birthDate: Date, userID: String, address: String, email: String, cpf: String, boi: Boi) {
        self.name = name
        self.birthDate = birthDate
        self.userID = userID
        self.address = address
        self.email = email
        self.cpf = cpf
        self.boi = boi
    }
}

