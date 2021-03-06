//
//  URL+Document.swift
//  FitGoal
//
//  Created by Christian Slanzi on 26.03.20.
//  Copyright © 2020 Christian Slanzi. All rights reserved.
//

import Foundation

extension URL {
    
    // returns an absolute URL to the desired file in documents folder
    static func inDocumentsFolder(fileName: String) -> URL {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
            .appendingPathComponent(fileName)
    }
}
