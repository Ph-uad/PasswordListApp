//
//  PasswordDetails.swift
//  PasswordListApp
//
//  Created by ツ水 on 09/01/2024.
//

import SwiftUI

struct PasswordDetails: View {
    
    var app : String
    var password : String
    var username : String
    
    var body: some View {
        VStack(alignment: .leading){
           
           
            Section{
                Text("App")
                    .font(.title)
                Text("\(app)")
            }
            
            Section{
                Text("Username")
                    .font(.title)
                Text("\(username)")
            }
            
            Section{
                Text("Password")
                    .font(.title)
                Text("\(password)")
            }
            
            Spacer()
        }
    }
}

#Preview {
    PasswordDetails(app: "App", password: "****", username: "John Doe")
}
