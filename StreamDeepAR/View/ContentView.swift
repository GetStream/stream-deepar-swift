//
//  ContentView.swift
//  StreamDeepAR
//
//  Created by Stefan Blos on 29.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var filtersService: FiltersService
    
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
        ContentView(filtersService: FiltersService())
    }
}