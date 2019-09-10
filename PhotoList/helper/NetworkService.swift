//
//  NetworkService.swift
//  PhotoList
//
//  Created by Luke on 2019/9/11.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import Foundation

class NetworkService: NSObject {
    
    static let url: URL! = URL(string: "https://jsonplaceholder.typicode.com/photos")
    
    class func fetchPhoto(completion: @escaping ([PhotoDataModel])->()) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil && data != nil {
                print(error!)
                return
            }
            
            do {
                completion(try JSONDecoder().decode([PhotoDataModel].self, from: data!))
                
            } catch {
                print(error.localizedDescription)
            }
            
        }).resume()
    }
}
