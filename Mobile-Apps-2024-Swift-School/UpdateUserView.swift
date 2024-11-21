//
//  UpdateUserView.swift
//  Mobile-Apps-2024-Swift-School
//
//  Created by Paritosh N Vaghasiya on 11/13/24.
//

import SwiftUI

struct UpdateUserView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var city = ""
    @State private var errorMessage = ""
    @State private var isUpdated = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                HStack{
                    Image(systemName: "person")
                    TextField("First Name", text: $firstName)
                }
                HStack{
                    Image(systemName: "person")
                    TextField("Last Name", text: $lastName)
                }
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    TextField("City", text: $city)
                }
                if !errorMessage.isEmpty{
                    Text(errorMessage).foregroundColor(.red)
                }
                
                Button("Update"){
                    Task{
                        await update()
                    }
                }.disabled(firstName.isEmpty || lastName.isEmpty || city.isEmpty)
            }
            .padding()
            .navigationDestination(isPresented: $isUpdated){
                MainView()
            }
        }
    }
    
    func update() async {
        do{
            try await SupabaseManager.shared.updateUserData(firstName: firstName, lastName: lastName, city: city)
            isUpdated = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    UpdateUserView()
}
