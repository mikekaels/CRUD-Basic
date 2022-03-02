//
//  APIManager.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.
//

import Foundation
import CoreData

enum CustomError: Error {
    case noInternetConnection
    case unexpected
}

class APIManager {
    static let shared = APIManager()
    private let httpService = Service()
    
    func fetchAllPost(completion: @escaping(Result<[Post], CustomError>) -> Void) {
        
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .getAllPost
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode([Post].self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.unexpected))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func createPost(title: String, content: String, completion: @escaping(Result<Post, CustomError>) -> Void) {
        print(title, content)
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .createPost(title: title, content: content)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(Post.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.unexpected))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func updatePost(title: String, content: String, id: Int, completion: @escaping(Result<Post, CustomError>) -> Void) {
        print("ID: ",id)
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .updatePost(id: id, title: title, content: content)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(Post.self, from: data)
                            
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.unexpected))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func detailPost(id: Int, completion: @escaping(Result<Post, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .getDetailPost(id: id)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(Post.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.unexpected))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
    func deletePost(id: Int, completion: @escaping(Result<Post, CustomError>) -> Void) {
        if !Connectivity.isConnectedToInternet {
            completion(.failure(.noInternetConnection))
        } else {
            do {
                try APIRouter
                    .deletePost(id: id)
                    .request(usingHttpService: httpService)
                    .responseJSON { result in
                        guard [200, 201].contains(result.response?.statusCode), let data = result.data else { return }
                        do {
                            let result = try JSONDecoder().decode(Post.self, from: data)
                            completion(.success(result))
                        } catch {
                            print(error)
                            completion(.failure(.unexpected))
                        }
                    }
                
            } catch {
                completion(.failure(error as! CustomError))
            }
        }
    }
    
}
