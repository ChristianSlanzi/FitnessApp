//
//  UserAccountDTO.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

struct UserAccountDTO {
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

// MARK: - MappableProtocol Implementation
extension UserAccountDTO: MappableProtocol {
    
    func mapToPersistenceObject() -> UserAccount {
        let model = UserAccount()
        model.name = name
        model.email = email
        model.password = password
        return model
    }
    
    static func mapFromPersistenceObject(_ object: UserAccount) -> UserAccountDTO {

        return UserAccountDTO(name: object.name, email: object.email, password: object.password)
    }
    
}
