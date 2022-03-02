//
//  Post.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.
//

import Foundation
import CoreData

struct Post: Codable {
    let id: Int?
    let title, content, publishedAt, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title, content
        case publishedAt = "published_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
