//
//  SupabaseManager.swift
//  Mobile-Apps-2024-Swift-School
//
//  Created by Paritosh N Vaghasiya on 11/13/24.
//

import Foundation
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()
    private let client: SupabaseClient
    
    private init() {
        let url = URL(string: "https://egzhuriimugvkjiauphl.supabase.co")!
        let key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVnemh1cmlpbXVndmtqaWF1cGhsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQwNzEzNjcsImV4cCI6MjAzOTY0NzM2N30.29e4s0hYCEB3e4m0GDB2WgSpEDbiJSSC4FOg5aU8ZOk"
        client = SupabaseClient(supabaseURL: url, supabaseKey: key)
    }
    
    func getSession() async throws -> User? {
        do{
            let session = try await client.auth.session
            print("Authenticated User:", session.user)
            return session.user
        }catch{
            print("Failed to retriveve session:", error.localizedDescription)
            throw error
        }
    }
    
    func signup(email: String, password: String) async throws -> Void{
        do{
            let user = try await client.auth.signUp(email: email, password: password)
            print("User signed up:", user)
        }catch{
            print("Sign up failed:", error.localizedDescription)
            throw error
        }
    }
    
    func createUserData(user: UserModel) async throws {
        do{
            let data = try await client.from("Table_2").insert([
                "firstName": user.firstName,
                "lastName": user.lastName,
                "city": user.city,
                "email": user.email,
            ]).execute()
        }
    }
    
    func signIn(email: String, password: String) async throws -> User{
        do{
            let session = try await client.auth.signIn(email: email, password: password)
            print("User signed in:", session.accessToken)
            return session.user
        }catch{
            print("Sign up failed:", error.localizedDescription)
            throw error
        }
    }
    
    func fetchUserData() async throws -> [UserModel]{
        guard let user = try await getSession() else {
            throw NSError(domain: "SupabaseManager", code: 401, userInfo: [NSLocalizedDescriptionKey: "No user session"])
        }
        
        print("Fetching useer ID:", user.id)
        
        do{
            let response = try await client.from("Table_2").select().eq("id", value: user.id).execute()
            let users = try JSONDecoder().decode([UserModel].self, from: response.data)
            return users
        }catch{
            print("Failed to fetch user data:", error.localizedDescription)
            throw error
        }
    }
    
    func signOut() async throws {
        do {
            try await client.auth.signOut()
            print("User signed out successfully")
        } catch {
            print("Sign out failed:", error.localizedDescription)
            throw error
        }
    }
    
    func updateUser(firstName: String, lastName: String, city: String) async throws {
        do{
        
        }
    }
}
