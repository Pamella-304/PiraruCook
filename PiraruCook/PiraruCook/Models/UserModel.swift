//
//  ChallengeModel.swift
//  fjordfairies
//
//  Created by Larissa Okabayashi on 27/03/24.
//

import Foundation
import CloudKit
// AGGREGATE MODEL

@MainActor
class UserModel: ObservableObject {
    private var db = CKContainer(identifier: "iCloud.com.academy.fjordfairies").publicCloudDatabase
    @Published private var Dictionary: [CKRecord.ID: User] = [:]
    @Published var Users: [User] = []
    
    func addUser(user: User) async throws -> CKRecord? {
        let record = try await db.save(user.record)
        guard let savedUser = User(record: record) else { return nil}
        Dictionary[user.recordId!] = savedUser
        return record
    }
    
    func updateUser(editedUser: User) async throws {
        Dictionary[editedUser.recordId!]?.name = editedUser.name
        Dictionary[editedUser.recordId!]?.email = editedUser.email
        Dictionary[editedUser.recordId!]?.address = editedUser.address
        Dictionary[editedUser.recordId!]?.cpf = editedUser.cpf
        Dictionary[editedUser.recordId!]?.boi = editedUser.boi
        Dictionary[editedUser.recordId!]?.userID = editedUser.userID
        Dictionary[editedUser.recordId!]?.birthDate = editedUser.birthDate
        do {
            let record = try await db.record(for: editedUser.recordId!)
            record[RecordKeysUser.name.rawValue] = editedUser.name
            record[RecordKeysUser.email.rawValue] = editedUser.email
            record[RecordKeysUser.address.rawValue] = editedUser.address
            record[RecordKeysUser.cpf.rawValue] = editedUser.cpf
            record[RecordKeysUser.userID.rawValue] = editedUser.userID
            record[RecordKeysUser.birthDate.rawValue] = editedUser.birthDate
            try await db.save(record)
        } catch {
            Dictionary[editedUser.recordId!] = editedUser
            print(error)
        }
    }
    func deleteUser(UserToBeDeleted: User) async throws {
        Dictionary.removeValue(forKey: UserToBeDeleted.recordId!)
        do {
            let _ = try await db.deleteRecord(withID: UserToBeDeleted.recordId!)
        } catch {
            Dictionary[UserToBeDeleted.recordId!] = UserToBeDeleted
            print(error)
        }
    }
    func populateChallenge() async throws {
        let query = CKQuery(recordType: RecordKeysUser.type.rawValue, predicate: NSPredicate(value: true))
        query.sortDescriptors = [NSSortDescriptor(key: "user", ascending: false)]
        let result = try await db.records(matching: query)
        let records = result.matchResults.compactMap { try? $0.1.get() }
        records.forEach { record in
            Dictionary[record.recordID] = User(record: record)
        }
        Users = Dictionary.values.compactMap { $0 }
    }
    
    // receives RecordName and outputs class challenge
//    func parseChallenge(currentChallenge: String) async throws -> Challenge?{
//           let recordID: CKRecord.ID = CKRecord.ID(recordName: currentChallenge)
//           let predicate = NSPredicate(format: "recordID=%@", recordID)
//           let query = CKQuery(recordType: "Challenge", predicate: predicate)
//
//           let result = try await db.records(matching: query)
//           let records = result.matchResults.compactMap { try? $0.1.get() }
//           records.forEach { record in
//               Dictionary[record.recordID] = Challenge(record: record)
//           }
//           Challenges = Dictionary.values.compactMap { $0 }
////           print(Challenges.first)
//           return Challenges.first
//       }
       
       func parseRecordName(user: User) -> String?{
           return user.recordId?.recordName
       }
}
