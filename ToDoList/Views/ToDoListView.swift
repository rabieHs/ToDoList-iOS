//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel : TodoListViewModel
    @FirestoreQuery var items :[ToDoListItem]

    
    init( userId: String) {
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/Todos")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                
                List(items) { item in
                    ToDoListItemView(item: item).swipeActions(content: {
                        Button{
                            viewModel.delete(id: item.id)
                            
                        }label: {
                            Text("Delete")
                        }.tint(.red)
                    })
                }
                .listStyle(PlainListStyle())
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
        ToDoListView(userId: "vc56r1Aqtbh26gsEfSfNfs1xL8r1")
    }
}

