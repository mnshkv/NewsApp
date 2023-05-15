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
    
    private var _uid: String?
    public var uid: String? {
        return _uid
    }
    
    public func anonimAuth() {
        firebaseAuth.signInAnonymously { authResult, error in
            if let error = error {
                print("auth failed: ", error.localizedDescription)
                return
            }
            
            if let authResult = authResult {
                self._uid = authResult.user.uid
            }
        }
    }
    
    public func exit() {
        try? firebaseAuth.signOut()
    }
    
    public func emailAuth() {
        
    }
}
