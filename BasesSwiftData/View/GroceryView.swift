//
//  GroceryView.swift
//  BasesSwiftData
//
//  Created by David Grammatico on 30/07/2023.
//

import SwiftUI

struct GroceryView: View {
    @Bindable var grocery: GroceryItem
    var body: some View {
        HStack(content: {
            Toggle(grocery.name, isOn: $grocery.isBought)
        })
    }
}
