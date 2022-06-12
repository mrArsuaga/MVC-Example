//
//  NetworkService.swift
//  MVC Example
//
//  Created by Jose Arsuaga on 11/06/22.
//

import Foundation

class NetworkService {
    static let shared: NetworkService = NetworkService()
    private init() { }
    
    private var user: User?
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                if email.elementsEqual("test@test.com") && password.elementsEqual("password") {
                    self.user = User(firstName: "Jose", lastName: "Arsuaga", email: email, age: 32, location: Location(lat: 20, lng: 20))
                    completion(true)
                } else {
                    self.user = nil
                    completion(false)
                }
                
            }
            
        }
    }
}
