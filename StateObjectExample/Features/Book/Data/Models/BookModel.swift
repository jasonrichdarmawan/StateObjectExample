//
//  BookModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

struct BookModel: Codable {
    let id, title, summary: String?
}

extension BookModel {
    func toDomain() -> BookEntity {
        return BookEntity(id: UUID(), title: title ?? "", summary: summary ?? "")
    }
}
