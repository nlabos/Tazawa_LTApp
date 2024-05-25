//
//  SoundPlayer.swift
//  LT_Music
//
//  Created by NlaboStaff on 2024/01/26.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject, AVAudioPlayerDelegate, ObservableObject{
    var musicPlayer: AVAudioPlayer!
    
    // 音楽の現在の再生時間を取得
    var currentTime: TimeInterval {
        musicPlayer?.currentTime ?? 0
    }
    
    // 音楽の総再生時間を取得
    var duration: TimeInterval {
        musicPlayer?.duration ?? 0
    }
    
    // 音楽を再生
    func playMusic(fileName: String) {
        guard let musicData = NSDataAsset(name: fileName)?.data else {
            print("音楽ファイルが見つかりません")
            return
        }
        
        do {
            musicPlayer = try AVAudioPlayer(data: musicData)
            musicPlayer.delegate = self
            musicPlayer.play()
        } catch {
            print("エラー発生.音を流せません")
        }
    }
    
    // 音楽を停止
    func stopAllMusic() {
        musicPlayer?.stop()
        musicPlayer?.currentTime = 0
    }
}
