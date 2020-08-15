//
//  DetailAyaViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
import AVFoundation

class DetailAyaViewController: BaseViewController {
    var player: AVPlayer? = AVPlayer()
      var isPlaying: Bool = false
    var appendNumberAya: String?

    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var ayaNumberLabel: UILabel!
    @IBOutlet weak var ayaLabel: UILabel!
    @IBOutlet weak var surNameAyaLabel: UILabel!
    @IBOutlet weak var tafsirAuthorLbl: UILabel!
    @IBOutlet weak var ayaView: UIView!
    @IBOutlet weak var tafsirDescriptionLabel: UITextView!
    var viewModel: AyaObjectViewModel?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: PreviousAyatViewController(), titleHeader: "كل يوم آية")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ayaView.roundCorners([.topLeft, .bottomRight], radius: 10.0)
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        if viewModel == nil {
            
        } else {
            self.ayaNumberLabel.text = "آية:" + "\(viewModel!.ayaNumber)"
            self.ayaLabel.text = viewModel?.aya
            self.surNameAyaLabel.text = "سورة:" + viewModel!.suraName
            self.tafsirAuthorLbl.text = "تفسير:" + viewModel!.tafsirAuthor
            self.tafsirDescriptionLabel.text = viewModel?.tafsir
        }
    }
    @IBAction func playAya(_ sender: Any) {
        if isPlaying {
            isPlaying = false
            //pause
            player?.pause()
            
            //                 playPauseButton.setImage(UIImage(named: "play_btn"), for: .normal)
            playPauseButton.setImage(UIImage(named: "play_btn"), for: .normal)
            playPauseButton.imageView?.contentMode = .scaleAspectFit
            playPauseButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
            playPauseButton.setTitle("تشغيل", for: .normal)
            
        } else {
            isPlaying = true
            // play
            player?.play()
            //                 playPauseButton.setImage(UIImage(named: "pause_btn"), for: .normal)
            playPauseButton.setImage(UIImage(named: "pause_btn"), for: .normal)
            playPauseButton.imageView?.contentMode = .scaleAspectFit
            playPauseButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
            playPauseButton.setTitle("إيقاف", for: .normal)
            
//            self.viewModel?.todayAyaApi() { [weak self] todayAyaModel in
                
                if viewModel!.ayaNumber < 10 {
                    self.appendNumberAya = "00"  + "\(viewModel!.ayaNumber)"
                } else if viewModel!.ayaNumber >= 10 &&  viewModel!.ayaNumber < 100{
                    self.appendNumberAya = "0"  + "\(viewModel!.ayaNumber)"
                } else if viewModel!.ayaNumber >= 100 {
                    self.appendNumberAya =  "\(viewModel!.ayaNumber)"
                }
                
                if UserDefaults.standard.value(forKey: "getNameReciter") as? String != nil {
                    let nameReciter = UserDefaults.standard.value(forKey: "getNameReciter") as? String
                    for indexAyaname in 0..<KeyAndValue.SURA_NAME.count {
                        
                        if  KeyAndValue.SURA_NAME[indexAyaname].name == viewModel!.suraName {
                            self.initPlayer(url: "http://212.57.192.148/ayat/mp3/\(nameReciter!)/\(KeyAndValue.SURA_NAME[indexAyaname].id)\(self.appendNumberAya!).mp3")
                            break
                        }
                        
                    }
                    
                } else {
                    print("fjwefklewfewf")
                }
                
                
                
            }
//        }
    }
    func initPlayer(url : String) {
          guard let url = URL.init(string: url) else { return }
          let playerItem = AVPlayerItem.init(url: url)
          NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(sender:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)

          player = AVPlayer.init(playerItem: playerItem)
        
          isPlaying = true
          player?.play()
          
        playPauseButton.setImage(UIImage(named: "pause_btn"), for: .normal)
          playPauseButton.setTitle("تشغيل", for: .normal)

      }
    
    @objc func playerDidFinishPlaying(sender: Notification) {
           // Your code here
           playPauseButton.setImage(UIImage(named: "play_btn"), for: .normal)
           playPauseButton.imageView?.contentMode = .scaleAspectFit
           playPauseButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
           playPauseButton.setTitle("تشغيل", for: .normal)
       }
    @objc func share(sender:UIView){
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        let textToShare = viewModel?.aya
        
        if let myWebsite = URL(string: "http://bit.ly/2OF1tyg") {//Enter link to your app here
            let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.mail, UIActivity.ActivityType.postToFacebook]
            //
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }
        
        
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
