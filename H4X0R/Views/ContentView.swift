//
//  ContentView.swift
//  H4X0R
//
//  Created by Seth Thorup on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.hits) { hit in
                NavigationLink(destination: DetailView(url: hit.url)) {
                    HStack {
                        Image(systemName: "arrow.up.heart")
                        Text(String(hit.points))
                        Text(hit.title)
                            .bold()
                        
                    }
                }
            }
            .listStyle(.plain)
            .navigationBarTitle("H4XOR News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
