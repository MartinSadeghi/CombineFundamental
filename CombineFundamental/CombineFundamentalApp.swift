//
//  CombineFundamentalApp.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 05/09/23.
//

import SwiftUI

@main
struct CombineFundamentalApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesView()
                .onAppear {
                    run()
                }
                
        }
    }
}
