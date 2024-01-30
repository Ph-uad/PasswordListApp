//
//  ContentView.swift
//  PasswordListApp
//
//  Created by ツ水 on 03/01/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var pass: FetchedResults<Password>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List{
                    ForEach(pass) { pass in
                        NavigationLink(destination: PasswordDetails(app: pass.app!, password: pass.password!, username: pass.username!)){
                            HStack{
                                VStack(alignment: .leading){
                                    Text(pass.app ?? "")
                                        .bold()
                                    Text(pass.username ?? "")
                                }
                                
                                Spacer()
                                
                                Text(calcLastTime(date: pass.date!))
                                    .foregroundStyle(.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deletePassword)
                }
                .listStyle(.plain)
            }.navigationTitle("Password logs")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showingAddView.toggle()
                        }label : {
                            Label("Add Password", systemImage: "plus.circle")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
                .sheet(isPresented: $showingAddView){
                    AddPasswordView()
                }
        }
            .navigationViewStyle(.stack)
    }
    private func deletePassword(offsets: IndexSet) {
          withAnimation {
              offsets.map { pass[$0] }
              .forEach(managedObjContext.delete)
              
              // Saves to our database
              DataController().save(context: managedObjContext)
          }
      }
}

#Preview {
    ContentView()
}
