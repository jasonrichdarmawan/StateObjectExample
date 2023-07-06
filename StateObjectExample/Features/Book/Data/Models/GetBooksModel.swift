//
//  GetBooksModel.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 07/07/23.
//

import Foundation

struct GetBooksModel: Codable {
    let data: [BookModel]?
    let meta: MetaModel?
}

extension GetBooksModel {
    struct MetaModel: Codable {
        /// how many books are there in the data source?
        let count: String?
    }
}
