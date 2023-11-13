//
//  ItemListView.swift
//  Pro IPhone Understanding Data Persistence
//
//  Created by Eddington, Nick on 11/1/23.
//

import SwiftUI
import CoreData

struct ItemListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [], animation: .default) private var items: FetchedResults<Item>

    @State private var newItemTitle = ""
    @State private var newItemYear = ""
    @State private var newItemDirector = ""

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add New Item")) {
                    TextField("Title", text: $newItemTitle)
                    TextField("Year", text: $newItemYear)
                    TextField("Director", text: $newItemDirector)
                    Button("Add Item") {
                        addItem()
                    }
                }

                Section(header: Text("Items")) {
                    ForEach(items) { item in
                        Text("\(item.title ?? "") (\(item.year ?? "")) - \(item.director ?? "")")
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Item List")
            .navigationBarItems(trailing: NavigationLink(destination: ContentView()) {
                Text("Back")
            })
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.title = newItemTitle
            newItem.year = newItemYear
            newItem.director = newItemDirector
            newItemTitle = ""
            newItemYear = ""
            newItemDirector = ""
            try? viewContext.save()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            try? viewContext.save()
        }
    }
}


#Preview {
    ItemListView()
}
