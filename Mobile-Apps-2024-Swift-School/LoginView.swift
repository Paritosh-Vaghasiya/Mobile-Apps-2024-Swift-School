//
//  LoginView.swift
//  Mobile-Apps-2024-Swift-School
//
//  Created by Paritosh N Vaghasiya on 11/13/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                HStack{
                    Image(systemName: "envelope.fill")
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                HStack{
                    Image(systemName: "lock.fill")
                    SecureField("Password", text: $password)
                }
                if errorMessage.isEmpty == false {
                    Text(errorMessage).foregroundColor(.red)
                }
                
                Button("Login"){
                    Task{
                        await login()
                    }
                }
                .disabled(email.isEmpty || password.isEmpty)
            }
            .padding()
            .navigationTitle("Login")
            .navigationDestination(isPresented: $isLoggedIn){
                MainView()
            }
        }
    }
    
    func login() async {
        //Fill later
    }
}

#Preview {
    LoginView()
}
