//
//  SoundViewController.swift
//  SwiftMousouLINE1
//
//  Created by seijiro on 2019/03/23.
//  Copyright © 2019 norainu. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var imageView2: UIImageView!

  var audioPlayer: AVAudioPlayer!

  var count = 0

  override func viewDidLoad() {
        super.viewDidLoad()

      imageView2.isHidden = true

      timeLabel.isHidden = true

      //音声 callMusic.mp3を再生する
      if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
        do {
          audioPlayer = try AVAudioPlayer(contentsOf: url)
          audioPlayer?.play()
        } catch {
          audioPlayer = nil

        }
      } else {
        fatalError("url is nil")
      }
    

    }
    
  @IBAction func tap(_ sender: Any) {
    // imageView2を表示
    imageView2.isHidden = false

    //timeLabelを表示
    timeLabel.isHidden = false
    // タイマーをスタートさせてラベルへ秒を表示
    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountUp), userInfo: nil, repeats: true)
    timeLabel.text = String(count)

    // baby.mp3を再生
    if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
      do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
      } catch {
        audioPlayer = nil

      }
    } else {
      fatalError("url is nil")
    }

  }

  @objc func timerCountUp() {
    count = count + 1
    timeLabel.text = String(count)
  }

  @IBAction func deny2(_ sender: Any) {

    // callMusic.mp3をストップ
    audioPlayer?.stop()

    // 画面を戻す(簡単)
    dismiss(animated: true, completion: nil)
  }

  @IBAction func deny(_ sender: Any) {
    // 画面を戻す(簡単)
    dismiss(animated: true, completion: nil)

  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
