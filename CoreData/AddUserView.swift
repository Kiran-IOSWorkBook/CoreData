//
//  AddUserView.swift
//  CoreData
//
//  Created by Kiran on 09/09/26.
//

import SwiftUI
import CoreData

struct AddUserView: View {
    @Environment(\.dismiss) private var dismiss
        
    @State private var name = ""
    @State private var email = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                TextField("Enter name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                TextField("Enter email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding(.horizontal)

                Button {
                    saveUser()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top, 30)
            .navigationTitle("Add User")
        }
    }

//    private func saveUser() {
//        print("Name: \(name)")
//        print("Email: \(email)")
//    }
    
    private func saveUser() {
        let context = PersistenceController.shared.container.viewContext

        let user = Item(context: context)
        user.name = name
        user.email = email

        do {
            try context.save()
            print("User saved successfully")
        } catch {
            print("Failed to save user: \(error)")
        }
        dismiss()
    }
    
}

#Preview {
    AddUserView()
}
