//
//  SongInfo.swift
//  MusicPlayer
//
//  Created by Валентина Евдокимова on 03.05.2023.
//

import SwiftUI

struct SongInfo: View {
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    var body: some View {
        HStack {
            GeometryReader { geometry in
                
                Image("music")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipShape(Circle())
            }
            .frame(width: 45, height: 45)
            .padding()
            Text("Song Name")
                .lineLimit(1)
                
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: ImageName.pause.rawValue)
        
            }
            
            Button {
                
            } label: {
                Image(systemName: ImageName.forward.rawValue)
        
            }
            .padding()

        }
        .font(.avenir(.light, size: 22))
        .foregroundColor(.white)
        .onTapGesture {
            // MARK: Expand buttom sheet
            withAnimation(.easeInOut(duration: 0.3)) {
                expandSheet = true
            }
        }
    }
}
