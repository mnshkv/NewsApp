//
//  ProfileViewController.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    let profileService = ProfileService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        
        profileService.fetchProfile { profile in
            if let profile = profile {
                print("APP: look on profile \(profile.name)")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
