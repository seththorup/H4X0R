//
//  DetailView.swift
//  H4X0R
//
//  Created by Seth Thorup on 1/28/23.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "hello")
    }
}
