import SwiftUI

struct MusicPlayerView: View {
    @EnvironmentObject var viewModel: ViewModel
    let musicplayer = SoundPlayer()
    @State private var sliderValue: Double = 0
    @State private var isPlaying = false

    var body: some View {
        NavigationView {
            VStack {
                if let selectedPhoto = viewModel.selectedPhoto {
                    Image(selectedPhoto.photoImageName) // 画像を表示
                        .resizable()
                        .frame(width: 320, height: 320)
                        .cornerRadius(30)
                        .shadow(radius: 20)
                        .padding()
                    
                    Text(selectedPhoto.photoName) // 曲名を表示
                        .padding()
                        .fontWeight(.heavy)
                }
                
                if musicplayer.duration > 0 {
                    // 音楽の再生時間が0以上の場合のみスライダーを表示
                    Slider(value: $sliderValue, in: 0...musicplayer.duration, step: 0.1)
                        .padding()
                } else {
                    // 音楽がロードされていない場合はプレースホルダーテキストを表示
                    Text("音楽を選択してください")
                        .padding()
                }

                HStack {
                    Button(action: {
                        viewModel.moveToPreviousTrack()
                        playMusic()
                    }) {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .padding()
                    }

                    Button(action: {
                        togglePlayPause()
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .padding()
                    }

                    Button(action: {
                        viewModel.moveToNextTrack()
                        playMusic()
                    }) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .padding()
                    }
                }

                Spacer()
            }
        }
    }

    private func playMusic() {
        if let musicFileName = viewModel.selectedPhoto?.musicFileName {
            musicplayer.stopAllMusic() // 前の音楽を停止
            musicplayer.playMusic(fileName: musicFileName)
            isPlaying = true
            sliderValue = musicplayer.currentTime
        }
    }

    private func togglePlayPause() {
        if isPlaying {
            musicplayer.stopAllMusic()
            isPlaying = false
            sliderValue = 0
        } else {
            playMusic()
        }
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView().environmentObject(ViewModel())
    }
}

