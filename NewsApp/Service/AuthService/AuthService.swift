//
//  AuthService.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 11.05.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class AuthService {
    static let shared = AuthService()
    
    private let firebaseAuth = Auth.auth()
    private let profileService = ProfileService()
    
    private var _uid: String?
    public var uid: String? {
        return _uid
    }
    
    public func anonimAuth() {
        guard let user = firebaseAuth.currentUser else {
            firebaseAuth.signInAnonymously { authResult, error in
                if let error = error {
                    print("auth failed: ", error.localizedDescription)
                    return
                }
                
                if let authResult = authResult {
                    self._uid = authResult.user.uid
                    self.profileService.createProfile()
                }
            }
            return
        }
        
        self._uid = user.uid
    }
    
    public func exit() {
        try? firebaseAuth.signOut()
    }
    
    public func emailAuth() {
        
    }
}
