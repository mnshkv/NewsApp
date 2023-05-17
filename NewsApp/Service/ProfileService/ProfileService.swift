//
//  ProfileService.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 17.05.2023.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

class ProfileService {
    private let path = "profiles"
    private let db = Firestore.firestore()
    
    public func fetchProfile(handler: @escaping (ProfileDTO?) -> ()) {
        guard let uid = AuthService.shared.uid else {
            print("APP: oops uid is empty")
            return handler(nil)
        }
        
        print("APP: UID \(uid)")
        
        db.collection(path).whereField("userId", isEqualTo: uid).getDocuments { snapshot, error in
            if let _ = error {
                print("APP: fetch error")
                handler(nil)
                return
            }
            
            if let documets = snapshot?.documents {
                let profiles = documets.compactMap { item in
                    try? item.data(as: ProfileDTO.self)
                }
                
                guard let profile = profiles.first else {
                    return handler(nil)
                }
                
                print("APP: fetch success")
                handler(profile)
            }
        }
    }
    
    public func createProfile() {
        guard let uid = AuthService.shared.uid else {
            print("APP: oops uid is empty")
            return
        }
        
        fetchProfile { firebaseProfile in
            guard let _ = firebaseProfile else {
                do {
                    let profile = ProfileDTO(userId: uid)
                    let _ = try self.db.collection(self.path).addDocument(from: profile)
                    
                } catch {
                    print(error)
                }
                
                return
            }
        }
    }
    
    public func createProfile(name: String, photoUrl: String) {
        guard let uid = AuthService.shared.uid else {
            print("APP: oops uid is empty")
            return
        }
        
        fetchProfile { firebaseProfile in
            guard let _ = firebaseProfile else {
                do {
                    let profile = ProfileDTO(name: name, photoUrl: photoUrl, userId: uid)
                    let _ = try self.db.collection(self.path).addDocument(from: profile)
                    
                } catch {
                    print(error)
                }
                
                return
            }
        }
    }
}
