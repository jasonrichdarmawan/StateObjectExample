//
//  StateObjectExampleApp.swift
//  StateObjectExample
//
//  Created by Jason Rich Darmawan Onggo Putra on 28/06/23.
//

import SwiftUI

@main
struct StateObjectExampleApp: App {
    var body: some Scene {
        WindowGroup {
#if DEBUG
            let dataSource = BookFakeDataSource()
#else
            let dataSource = BookRemoteDataSource()
#endif
            let repository = BookRepositoryImpl(dataSource: dataSource)
            let getBookUseCase = GetBookUseCaseImpl(repository: repository)
            BookListView(getBookUseCase: getBookUseCase)
        }
    }
}
