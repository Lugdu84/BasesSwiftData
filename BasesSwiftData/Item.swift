//
//  Item.swift
//  BasesSwiftData
//
//  Created by David Grammatico on 30/07/2023.
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
