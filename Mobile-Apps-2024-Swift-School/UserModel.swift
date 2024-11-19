//
//  UserModel.swift
//  Mobile-Apps-2024-Swift-School
//
//  Created by Paritosh N Vaghasiya on 11/13/24.
//

import Foundation

struct UserModel: Identifiable, Codable{
    var id: String?
    var firstName: String
    var lastName: String
    var city: String
    var email: String
    
    enum CodingKeys: String, CodingKey{
        case id = "id"
        case firstName = "firstName"
        case lastName = "lastName"
        case city = "city"
        case email = "email"
    }
    
    
}
