//
//  NewItemView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item").font(.system(size: 32)).bold().padding(.top, 100)
            Form{
                //TITLE
                
                
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                
                
                //DATE
                
                
                DatePicker("Due Date", selection: $viewModel.date).datePickerStyle(GraphicalDatePickerStyle())
                
                
                //BUTTON
                
                CustomButton(title: "Save", backgroundColor: .pink, action: {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                })
            }
            .alert(isPresented: $viewModel.showAlert, content: {Alert(title: Text("Error"), message: Text("Please Fill All Fields and select Valid Date ! "))})
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in}))
    }
}
