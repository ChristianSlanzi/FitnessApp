//
//  UserProfileDTO.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 29.10.20.
//

// MARK: - UserProfileDTO
struct UserProfileDTO {
    var gender: Gender
    var age: Int
    var height: Int //TODO cm... how to handle multiple height measure system?
    var weight: Double //TODO .. as above
    
    init() {
        gender = .man
        age = 0
        height = 0
        weight = 0.0
    }
    
    init(gender: Gender, age: Int, height: Int, weight: Double) {
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
    }
}

// MARK: - MappableProtocol Implementation
extension UserProfileDTO: MappableProtocol {
    
    func mapToPersistenceObject() -> UserProfile {
        let model = UserProfile()
        model.gender = gender
        model.age = age
        model.height = height
        model.weight = weight
        return model
    }
    
    static func mapFromPersistenceObject(_ object: UserProfile) -> UserProfileDTO {

        return UserProfileDTO(gender: object.gender, age: object.age, height: object.height, weight: object.weight)
    }
    
}
