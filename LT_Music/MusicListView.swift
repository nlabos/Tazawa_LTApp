//
//  MusicListView.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/26.
//

import SwiftUI

struct MusicListView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(photoArray) { item in
                NavigationLink(destination: MusicPlayerView().environmentObject(viewModel)) {
                    ListMusicPhotUI(photo: item)
                }
                .onTapGesture {
                    print("tapped")
                    viewModel.selectedPhoto = item
                    print(item.photoName)
                }
                
                
                
            }
            
            .navigationBarTitle("Music PlayList")
        }
    }
}


struct ListMusicPhotUI: View {
    var photo: PhotoModel

    var body: some View {
        HStack {
            Image(photo.photoImageName) // 画像ファイル名用のプロパティを使用
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(10.0)
            Text(photo.photoName)
                .padding()
        }
    }
}

// プレビュー
struct MusicListView_Previews: PreviewProvider {
    static var previews: some View {
        MusicListView()
    }
}
