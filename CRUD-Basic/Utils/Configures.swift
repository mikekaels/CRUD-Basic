//
//  Configures.swift
//  CRUD-Basic
//
//  Created by Santo Michael Sihombing on 01/03/22.
//

import Foundation

protocol Configurable {}
extension Configurable {
    @discardableResult
    func configure(completion: (Self) -> Void) -> Self {
        completion(self)
        return self
    }
}

extension NSObject: Configurable {}
