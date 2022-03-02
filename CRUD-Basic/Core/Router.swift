//
//  Router.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 02/03/22.
//

import Foundation
import Alamofire

enum APIRouter {
    case getAllPost
    case getDetailPost(id: Int)
    case createPost(title: String, content: String)
    case updatePost(id: Int, title: String, content: String)
    case deletePost(id: Int)
}

extension APIRouter: HttpRouter {
    
    var baseURL: String {
        switch self {
        default : return "https://limitless-forest-49003.herokuapp.com"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllPost, .getDetailPost: return .get
        case .createPost: return .post
        case .updatePost: return .put
        case .deletePost: return .delete
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
        
    }
    
    var path: String {
        switch self {
        case .getDetailPost(let id):
            return "posts/\(id)"
            
        case .updatePost(let id, _, _):
            return "posts/\(id)"
            
        case .deletePost(let id):
            return "posts/\(id)"
        default:
            return "posts"
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        default: return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default :
            return nil
        }
    }
    
    var body: Parameters? {
        switch self {
        case .createPost(let title, let content):
            return [
                "title":title,
                "content": content
            ]
        case .updatePost(_, let title, let content):
            return [
                "title":title,
                "content": content
            ]
        default: return nil
        }
    }
    
}

protocol HttpRouter: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    var parameter: Parameters? { return nil }

    func asURLRequest() throws -> URLRequest {

        var url =  try urlComponent().asURL()
        url.appendPathComponent(path)
        
        var request = try URLRequest(url: url, method: method, headers: headers)
        request = try URLEncoding.default.encode(request, with: body)
        
        return request
    }
    
    func urlComponent() throws -> URLComponents {
        var components = URLComponents(string: baseURL)!
        
        guard parameters != nil, let parameters = parameters else {
            return components
        }

        let items: [URLQueryItem] = parameters.map { (key, value) in
            return URLQueryItem(name: key, value: String(describing: value))
        }
        
        components.queryItems = items
        
        return components
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asURLRequest())
    }
}

