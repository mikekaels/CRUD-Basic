//
//  UserDefaults.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 03/03/22.
//

import Foundation
import UserNotifications

class UserDefaultManager {
    static let shared = UserDefaultManager()
    let defaults = UserDefaults.standard
    
    func savePost(id: Int, completion: @escaping(Bool) -> Void) {
        var posts: [Int] = getPosts()
        
        posts.append(id)
        
        do {
            let encodedData: Data = try PropertyListEncoder().encode(posts)
            defaults.set(encodedData, forKey: "posts")
            defaults.synchronize()
            completion(true)
        } catch {
            print("Error saved data")
            completion(false)
        }
    }
    
    func getPosts()-> [Int] {
        if let data = UserDefaults.standard.value(forKey:"posts") as? Data {
            let ids = (try? PropertyListDecoder().decode(Array<Int>.self, from: data)) ?? []
            return ids
        }
    
        return []
    }
    
    func removePost(id: Int, completion: @escaping(Bool) -> Void) {
        let posts = getPosts()
        
        let newPost = posts.filter { $0 != id }
        
        do {
            let encodedData: Data = try PropertyListEncoder().encode(newPost)
            defaults.set(encodedData, forKey: "posts")
            defaults.synchronize()
            completion(true)
        } catch {
            print("Error saved data")
            completion(false)
        }
    }
}
