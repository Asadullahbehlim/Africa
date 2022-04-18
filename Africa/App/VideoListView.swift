//
//  VideoListView.swift
//  Africa
//
//  Created by Asadullah Behlim on 05/04/22.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos: [Video] = Bundle.main.decode(file: "videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
      
            List(videos) {
         
                    item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id,
                        videoTitle: item.name)) {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
            
            } // loop
            } //list
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                  videos.shuffle()
                    hapticImpact.impactOccurred()
                }) {
                  Image(systemName: "arrow.2.squarepath")
                }
              }
            }
        } // navig
    }
}

struct VideoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        VideoListView()
            .previewLayout(.sizeThatFits)

    }
}
