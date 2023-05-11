//
//  BookmarkService.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 11.05.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BookmarkService {
    private let path = "bookmarks"
    private let db = Firestore.firestore()
    
    public func fetchBookmarks(handler: @escaping ([BookmarkDTO]) -> ()) {
        guard let uid = AuthService.shared.uid else {
            print("APP: oops uid is empty")
            return handler([])
        }
        
        db.collection(path).whereField("userId", isEqualTo: uid).getDocuments { snapshot, error in
            if let _ = error {
                print("APP: fetch error")
                handler([])
                return
            }
            
            if let documets = snapshot?.documents {
                let bookmarks = documets.compactMap { item in
                    try? item.data(as: BookmarkDTO.self)
                }
                
                print("APP: fetch success")
                handler(bookmarks)
            }
        }
    }
    
    public func addBookmark(_ bookmark: BookmarkDTO) {
        do {
            let _ = try db.collection(path).addDocument(from: bookmark)
        } catch {
            print(error)
        }
    }
    
}
