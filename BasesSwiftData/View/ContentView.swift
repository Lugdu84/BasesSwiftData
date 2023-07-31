//
//  ContentView.swift
//  BasesSwiftData
//
//  Created by David Grammatico on 30/07/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GroceryItem.name, order: .forward) private var groceryItems: [GroceryItem]
    @Query(FetchDescriptor(predicate: #Predicate {$0.isBought == true}, sortBy: [SortDescriptor(\GroceryItem.name, order: .forward)])) var bought: [GroceryItem]
    @Query(FetchDescriptor(predicate: #Predicate {$0.isBought == false}, sortBy: [SortDescriptor(\GroceryItem.name, order: .forward)])) var notBought: [GroceryItem]
    @State var text = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Nouvel article", text: $text)
                Divider()
                List {
                    Section("Tout", content: {
                        ForEach(groceryItems) { grocecy in
                            GroceryView(grocery: grocecy)
                        }
                        .onDelete(perform: deleteItems)
                    })
                    Section("Acheté") {
                        ForEach(bought) { grocery in
                            GroceryView(grocery: grocery)
                        }
                    }
                    Section("Non acheté") {
                        ForEach(notBought) { grocery in
                            GroceryView(grocery: grocery)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                        .disabled(text.isEmpty)
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            if !text.isEmpty {
                let newGrocery = GroceryItem(name: text)
                modelContext.insert(newGrocery)
                text = ""
            }
            
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(groceryItems[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: GroceryItem.self, inMemory: true)
}
