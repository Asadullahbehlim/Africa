//
//  HeadingView.swift
//  Africa
//
//  Created by Asadullah Behlim on 07/04/22.
//

import SwiftUI

struct HeadingView: View {
    
    
    var HeadingImage: String
    var HeadingText: String
    
    var body: some View {
        HStack {
          Image(systemName: HeadingImage)
            .foregroundColor(.accentColor)
            .imageScale(.large)
          
          Text(HeadingText)
            .font(.title3)
            .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(HeadingImage: "photo.on.rectangle.angled", HeadingText: "Wilderness in Pictures")
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
