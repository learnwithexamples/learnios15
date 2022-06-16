//
//  ContentView.swift
//  lesson2
//
//  Created by Learn with Examples on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    let index = [0, 1]
    let titles = ["Problem 1", "Problem 2"]
    let views: [Any] = [problem1View(), problem2View()]
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Problem 1", destination: problem1View())
                NavigationLink("Problem 2", destination: problem2View())
            }
            .navigationTitle("Lesson 2 homework")
            Text("Select a problem")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
