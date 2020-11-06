//
//  SettingsViewModel.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 31.10.20.
//

import CS_Common_UI

class SettingsViewModel {
    
    let dbManager: DataManager
    let userRepo: UserRepositoryProtocol
    private let navigationBarViewModel: NavigationBarModelView
    
    var user: UserDTO?
    var nameText: String = "___"
    var genderText: String = "___"
    var ageText: String = "___"
    var heightText: String = "___"
    var weightText: String = "___"
    
    init(navigationBarViewModel: NavigationBarModelView,
         dbManager: DataManager = RealmDataManager(RealmProvider.default)) {
        self.dbManager = dbManager
        self.userRepo = UserRepository(dbManager: dbManager)
        self.navigationBarViewModel = navigationBarViewModel
    }
    
    func getNavigationBarViewModel() -> NavigationBarModelView {
        return navigationBarViewModel
    }
    
    func getData() {
        
        //TODO: how many users? which is the current user?
        userRepo.getAllUsers(on: Sorted(key: "userId", ascending: true), completionHandler: { (users) in
            //print(users[0].firstName)
            //print(users[1].firstName)
            
            //TODO: atm I take the last user.
            guard let user = users.last else { return }
            self.user = user
            nameText = user.firstName
            guard let userProfile = user.userProfile else { return }
            genderText = userProfile.gender == .man ? "man" : "woman"
            ageText = "\(userProfile.age)"
            heightText = "\(userProfile.height)"
            weightText = "\(userProfile.weight)"
            
        })
    }
}
