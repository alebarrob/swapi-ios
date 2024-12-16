//
//  Item.swift
//  swapi
//
//  Created by Alejandro Barrera Robles on 25/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
