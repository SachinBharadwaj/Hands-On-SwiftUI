//
//  TutorialListView.swift
//  Tutorials
//
//  Created by Sachin Bharadwaj on 12/05/21.
//

import SwiftUI

struct TutorialListView: View {
    
    var videos = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                })
            }.navigationTitle("Mad iOS tutorials")
        }
    }
}

struct VideoCell: View {
    var video: Video
    
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 4)
            VStack(alignment: .leading, spacing: 5, content: {
                Text(video.title)
                    .font(.headline)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialListView()
    }
}
