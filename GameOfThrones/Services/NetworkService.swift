//
//  NetworkService.swift
//  GameOfThrones
//
//  Created by Eduardo Santiz on 3/25/19.
//  Copyright © 2019 EduardoSantiz. All rights reserved.
//

import UIKit

class NetworkService {
    
    func downloadData(url: String, completion: @escaping (Data?) -> Void) {
        guard let validURL = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            guard let json = data else {
                completion(nil)
                return
            }
            
            completion(json)
        }.resume()
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let image = ImageCache.shared.loadImageFromCache(with: url) {
            completion(image)
        } else {
            guard let validURL = URL(string: url) else {
                completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: validURL) { (data, response, error) in
                if error != nil {
                    completion(nil)
                    return
                }
                
                guard let imageData = data else {
                    completion(nil)
                    return
                }
                
                if let image = UIImage(data: imageData) {
                    ImageCache.shared.saveImageToCache(with: url, for: image)
                    
                    DispatchQueue.main.async {
                        completion(image)
                    }
                }
            }
        }
    }
    
}
