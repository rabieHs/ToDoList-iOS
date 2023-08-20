//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()
    let item : ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.toggleCheck(item:item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle").foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item:.init(id: "1234", title: "GetMilk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
