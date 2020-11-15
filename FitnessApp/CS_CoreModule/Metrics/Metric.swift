//
//  Metric.swift
//  CS_CoreModule
//
//  Created by Christian Slanzi on 15.11.20.
//

import Foundation

public struct Metric: Codable {
    var name: String
    var value: Double
}

extension Metric: CustomStringConvertible {
    private static var valueFormatter: NumberFormatter =  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var formattedValue: String {
        let number = NSNumber(value: value)
        return Self.valueFormatter.string(from: number)!
    }
    
    public var description: String {
        "\(name): \(formattedValue)"
    }
}

let pi = Metric(name: "pi", value: 3.14159265)
// print(pi.formattedValue) -> "3.14"
// print(pi.description) -> "pi: 3.14"
