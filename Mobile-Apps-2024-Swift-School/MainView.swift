//
//  MainView.swift
//  Mobile-Apps-2024-Swift-School
//
//  Created by Paritosh N Vaghasiya on 11/13/24.
//

import SwiftUI

struct MainView: View {
    //@State private var users = [UserModel]()
    @State private var errorMessage = ""
    @State private var showLoginView = false
    @State private var showUpdateUserView = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Welcome to the Main Screen")
                if errorMessage.isEmpty{
                    Text(errorMessage).foregroundColor(.red)
                }
                List(users){ user in
                    VStack(alignment: .leading){
                        Text("Name: \(user.firstName) \(user.lastName)")
                        Text("City: \(user.city)")
                        Text("Email: \(user.email)")
                    }
                }
                .onAppear{
                    Task {
                        await fetchUsers()
                    }
                }
                HStack{
                    Button("Update User"){
                        showUpdateUserView = true
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                    
                    Button("Logout"){
                        Task{
                            await logout()
                        }
                    }
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding()
                .navigationDestination(isPresented: $showLoginView){
                    LoginView()
                }
                .navigationDestination(isPresented: $showUpdateUserView){
                    UpdateUserView(showUpdateUserView: $showUpdateUserView)
                }
            }
            .navigationTitle("User Details")
        }
    }
    
    func fetchUsers() async{
        //Fill later
    }
    
    func logout() async{
        //Fill later
    }
}

#Preview {
    MainView()
}
