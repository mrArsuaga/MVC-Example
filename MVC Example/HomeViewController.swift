//
//  HomeViewController.swift
//  MVC Example
//
//  Created by Jose Arsuaga on 11/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = NetworkService.shared.getLoggedInUser() else { return }
        self.user = user
        welcomeUser()
        
        // Do any additional setup after loading the view.
    }
    
    private func welcomeUser() {
        welcomeLabel.text = "Hello, \(user.firstName) \(user.lastName)"
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
