//
//  RemoteConfigManager.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 15.11.20.
//

import Firebase
import FirebaseAnalytics
import FirebaseInstanceID

public protocol RemoteConfigManagerDelegate: class {
    func displayError(_ error: Error?)
    func updateUI()
}

class RemoteConfigManager {
    private var remoteConfig: RemoteConfig!
    
    //TODO: should we have a list of delegates?
    private var delegate: RemoteConfigManagerDelegate?
    
    private init() {
        //initializes the Firebase installed libraries using the constants provided in GoogleService-Info.plist
        FirebaseApp.configure()
        
    }
    
    /// Convenience init for injecting Remote Config instances during testing
    /// - Parameter remoteConfig: a Remote Config instance
    convenience init(remoteConfig: RemoteConfig) {
        self.init()
        self.remoteConfig = remoteConfig
    }
    
    // MARK: - SHARED INSTANCE
    static let shared = RemoteConfigManager()
    
    
    // MARK: - Firebase 🔥
    /// Initializes defaults from `RemoteConfigDefaults.plist` and sets config's settings to developer mode
    public func setupRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
    
    /// Fetches remote config values from the server
    private func fetchRemoteConfig() {
        remoteConfig.fetch { status, error in
            guard error == nil else {
                self.delegate?.displayError(error)
                return }
            print("Remote config successfully fetched!")
        }
    }
    
    /// Activates remote config values, making them available to use in your app
    private func activateRemoteConfig() {
        remoteConfig.activate { success, error in
            guard error == nil else {
                self.delegate?.displayError(error)
                return
            }
            print("Remote config successfully activated!")
            DispatchQueue.main.async {
                self.delegate?.updateUI()
            }
        }
    }
    
    /// Fetches and activates remote config values
    @objc
    public func fetchAndActivateRemoteConfig() {
        remoteConfig.fetchAndActivate { status, error in
            guard error == nil else {
                self.delegate?.displayError(error)
                return
            }
            print("Remote config successfully fetched & activated!")
            DispatchQueue.main.async {
                self.delegate?.updateUI()
            }
        }
    }
}

//Usage example
extension RemoteConfigManager {
    public enum RemoteConfigKeys : String, RemoteConfigKey {
        case homeText = "topLabelKey"
    }
    
    public func getValueForKey(_ key: RemoteConfigKeys) -> Any {
        let genericRemoteConfig = remoteConfig.asGeneric(ofType: RemoteConfigKeys.self)
        return genericRemoteConfig[key].stringValue!
    }
}




