//
//  AddPasswordView.swift
//  PasswordListApp
//
//  Created by ツ水 on 03/01/2024.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var password = ""
    @State private var username = ""
    @State private var app = ""
    
    var body: some View {
        Form{
            Section{
                TextField("App", text: $app)
            }

            Section{
                TextField("Username", text: $username)
            }
            
            Section{
                TextField("Password", text: $password)
            }
            
            HStack{
                Spacer()
                Button("Submit"){
                    DataController().addPassword(app: app, password: password, username: username,  context: managedObjContext)
                    dismiss()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    AddPasswordView()
}
