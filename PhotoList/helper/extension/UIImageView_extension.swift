//
//  UIImageView_extension.swift
//  PhotoList
//
//  Created by Luke on 2019/9/11.
//  Copyright © 2019 RaiseHead Studio. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCache(with urlString: String?) {
        
        guard
            let urlString = urlString,
            let url = URL(string: urlString) else { return }
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            image = cachedImage
//            print("use cache image")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
//                    print("image loaded")
                }
            })
            
        }).resume()
    }
    
}
