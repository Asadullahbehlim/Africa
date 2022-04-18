//
//  CoverImageView.swift
//  Africa
//
//  Created by Asadullah Behlim on 06/04/22.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - properties
    
    let coverImages: [CoverImage] = Bundle.main.decode(file: "covers.json")
    
    
    var body: some View {
        TabView {
            ForEach(coverImages) {
                item in
                Image(item.name)
                .resizable()
                .scaledToFill()
                
            }
        } //tabview
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
