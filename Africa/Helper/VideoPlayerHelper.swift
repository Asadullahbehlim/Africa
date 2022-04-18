//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Asadullah Behlim on 10/04/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if let Bundle = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: Bundle)
        videoPlayer?.play()
    }
    return videoPlayer!
}
