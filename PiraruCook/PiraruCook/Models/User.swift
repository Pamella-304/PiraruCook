import Foundation
import CloudKit


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

// classe para o modelo da atividade
// id: identificador de ID
// recordId: id do identificador de id dentro do conteiner
// name: nome do desafio
// description: descrição do desafio
// distance: distância do desafio
// img: imagem do desafio
// actualDist: distância atual que a comunidade já percorreu do desafio
// days: quantos dias o desafio já teve
// ActiveMembers: membros ativos no desafio
struct User: CKRecordValueProtocol, Identifiable, Hashable {
    var id: ObjectIdentifier
    var recordId: CKRecord.ID?
    var name: String
    var birthDate: Date
    var userID: String
    var address: String
    var email: String
    var cpf: String
    var boi: String
    
    var record: CKRecord {
        let record = CKRecord(recordType: RecordKeysUser.type.rawValue)
        record[RecordKeysUser.name.rawValue] = name
        record[RecordKeysUser.birthDate.rawValue] = birthDate
        record[RecordKeysUser.userID.rawValue] = userID
        record[RecordKeysUser.email.rawValue] = email
        record[RecordKeysUser.address.rawValue] = address
        record[RecordKeysUser.cpf.rawValue] = cpf
        record[RecordKeysUser.boi.rawValue] = boi
        return record
    }
    
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.recordId == rhs.recordId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
}
    
extension User{
    init?(record: CKRecord) {
        guard let name = record[RecordKeysUser.name.rawValue] as? String,
              
        let birthDate = record[RecordKeysUser.birthDate.rawValue] as? Date,
              
        let address = record[RecordKeysUser.address.rawValue] as? String,
              
        let email = record[RecordKeysUser.email.rawValue] as? String,
      
        let cpf = record[RecordKeysUser.cpf.rawValue] as? String,
              
        let boi = record[RecordKeysUser.boi.rawValue] as? String,
                
        let userId = record[RecordKeysUser.userID.rawValue] as? String else{
            print("erro de inicialização de usuário")
            return nil
        }
        
        self.init(id: ObjectIdentifier(User.self), name: name, birthDate: birthDate, userID: userId, address: address, email: email, cpf: cpf, boi: boi)
    }
}
