//
//  GroceryItem.swift
//  BasesSwiftData
//
//  Created by David Grammatico on 30/07/2023.
//

import SwiftData
import SwiftUI

@Model
class GroceryItem {
    var name: String
    var isBought: Bool
    
    init(name: String, isBought: Bool = false) {
        self.name = name
        self.isBought = isBought
    }
}
