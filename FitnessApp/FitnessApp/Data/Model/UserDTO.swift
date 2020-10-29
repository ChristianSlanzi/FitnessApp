//
//  UserDTO.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

// MARK: - UserDTO
struct UserDTO {
    var firstName = ""
    var userId: Int//UUID //TODO: like this?
    var userAccount: UserAccountDTO
    var userProfile: UserProfileDTO?
}

// MARK: - MappableProtocol Implementation

extension UserDTO: MappableProtocol {
    func mapToPersistenceObject() -> User {
        let model = User()
        model.firstName = firstName
        model.userId = userId
        model.userAccount = userAccount.mapToPersistenceObject()
        model.userProfile = userProfile?.mapToPersistenceObject()
        return model
    }
    static func mapFromPersistenceObject(_ object: User) -> UserDTO {
        return UserDTO(firstName: object.firstName,
                       userId: object.userId,
                       userAccount: UserAccountDTO.mapFromPersistenceObject(object.userAccount!),
                       userProfile: object.userProfile != nil ? UserProfileDTO.mapFromPersistenceObject(object.userProfile!) : nil)
    }
}
