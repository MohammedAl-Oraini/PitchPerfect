//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Mohammad Al-Oraini on 04/07/2019.
//  Copyright © 2019 Mohammad Al-Oraini. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!{
        didSet {
            snailButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var chipmunkButton: UIButton!{
        didSet {
            chipmunkButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var rabbitButton: UIButton!{
        didSet {
            rabbitButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var vaderButton: UIButton!{
        didSet {
            vaderButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var echoButton: UIButton!{
        didSet {
            echoButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var reverbButton: UIButton!{
        didSet {
            reverbButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var stopButton: UIButton!{
        didSet {
            stopButton.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    //MARK: playSoundForButton func
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    //MARK: stopButtonPressed func
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        
        stopAudio()
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
