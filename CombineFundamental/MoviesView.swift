//
//  ContentView.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 05/09/23.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}