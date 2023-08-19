//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI
struct ToDoListView: View {
    @StateObject var viewModel = TodoListViewModel()

    private let userId: String
    
    init( userId: String) {
        self.userId = userId
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("To Do List").toolbar{
                Button(action: {viewModel.showingNewItemView = true}, label:{ Image(systemName: "plus")
                    
                }
                )
            }.sheet(isPresented: $viewModel.showingNewItemView, content: {NewItemView(newItemPresented: $viewModel.showingNewItemView)})
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}

