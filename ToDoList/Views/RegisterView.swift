//
//  RegisterView.swift
//  ToDoList
//
//  Created by rabie houssaini on 14/8/2023.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organizing todo !", angle: -15, background: .orange)
            Form{
                TextField("FullName", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                TextField("Email address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).textInputAutocapitalization(.none).autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                CustomButton(title: "Register", backgroundColor: .green, action: {
                    viewModel.register()
                })

            }.offset(y:-50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
