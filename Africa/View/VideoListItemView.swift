//
//  VideoListItem.swift
//  Africa
//
//  Created by Asadullah Behlim on 10/04/22.
//

import SwiftUI

struct VideoListItemView: View {
    
    let video: Video
    
    var body: some View {
        HStack(spacing : 10) {
        ZStack {
        
        Image(video.thumbnail)
                  .resizable()
                  .scaledToFit()
            // Zoomed out Fit (100%)
                  .frame(height: 80)
                 .cornerRadius(9)
              
            Image(systemName: "play.circle")
            .resizable()
            .scaledToFit()
            .frame(height: 32)
            .shadow(radius: 4)
        }
            VStack(alignment:.leading, spacing:10){

                Text(video.name)
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)

          Text(video.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
            

            } // vstac

        
         
        } // hstac

    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode(file: "videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
