//
//  ProfileDTO.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 17.05.2023.
//

import Foundation
import FirebaseFirestoreSwift

struct ProfileDTO: Codable {
    @DocumentID var id: String?
    var name: String = "Anonimus"
    var photoUrl: String?
    var userId: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userId
        case photoUrl
    }
}
