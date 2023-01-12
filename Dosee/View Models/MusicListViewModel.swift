//
//  MusicListViewModel.swift
//  Dosee
//
//  Created by Arwa Ali Alshehri on 19/06/1444 AH.
//

import Foundation
class MusicListViewModel {
    func playMusic(name: String) {
        AudioManager.shared.playSoundEffect(for: name)
    }
    
    func stopMusic() {
        AudioManager.shared.player.stop()
    }
}
