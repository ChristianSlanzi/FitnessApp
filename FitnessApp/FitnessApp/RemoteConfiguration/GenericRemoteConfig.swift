//
//  GenericRemoteConfig.swift
//  FitnessApp
//
//  Created by Christian Slanzi on 15.11.20.
//

import UIKit
import Firebase

protocol RemoteConfigKey : RawRepresentable {
    
    var stringValue:String { get }
    
}
extension RemoteConfigKey where RawValue == String {
    
    var stringValue:String {
        return self.rawValue
    }
    
}

struct GenericRemoteConfig<T : RemoteConfigKey> {
    
    let associatedRemoteConfig:RemoteConfig
    
    subscript(key:T) -> RemoteConfigValue {
        return associatedRemoteConfig[key.stringValue]
    }
    
}

extension RemoteConfig {
    
    func asGeneric<T>(ofType type:T.Type = T.self) -> GenericRemoteConfig<T> where T : RemoteConfigKey {
        return GenericRemoteConfig<T>(associatedRemoteConfig: self)
    }
    
}
