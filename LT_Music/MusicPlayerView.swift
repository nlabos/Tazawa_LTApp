//
//  MusicPlayerView.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/26.
//

import SwiftUI

struct MusicPlayerView: View {
    let musicplayer = SoundPlayer()
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var slider: Double = 0.5
    @State private var isPlaying = false
    
    var body: some View {
        NavigationView{
            VStack {
                if let selectedPhoto = viewModel.selectedPhoto {
                    Image(selectedPhoto.photoImageName)
                        .resizable()
                        .id(selectedPhoto.id)
                        .frame(width: 320, height: 320)
                        .cornerRadius(30)
                        .shadow(radius: 20)
                        .padding()
                    
                    Text(selectedPhoto.photoName)
                        .padding()
                        .fontWeight(.heavy)
                    
                }
                
                
                Slider(value: $slider)
                    .padding()
                
                
                HStack {
                    Image(systemName: "backward.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                    
                    
                    if isPlaying {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .onTapGesture {
                                musicplayer.musicPlayer()
                                print("play")
                                isPlaying.toggle()
                            }
                    }
                    else {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .onTapGesture {
                                musicplayer.stopAllMusic()
                                print("pause")
                                isPlaying.toggle()
                                
                            }
                        
                    }
                    
                    Image(systemName: "forward.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                }
                
                Spacer()
            }
            //.navigationBarTitle(viewModel.selectedPhoto?.photoName ?? "C.R.E.A.M.")
            .onAppear {
                print("MusicPlayerViewが表示されました。")
                if let selectedPhoto = viewModel.selectedPhoto {
                    print("選択された写真: \(selectedPhoto.photoName)")
                } else {
                    print("写真はまだ選択されていません。")
                }
            }
            
        }
    }
}

#Preview {
    MusicPlayerView()
}