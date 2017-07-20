//
//  SoundViewController.swift
//  SoundBoard
//
//  Created by Apple on 7/19/17.
//  Copyright © 2017 Jeremy. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var record: UIButton!
    @IBOutlet weak var soundNameTextField: UITextField!
    
    var audioRecorder: AVAudioRecorder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRecorder()

    }

    func setupRecorder() {
        //Create an audio session
        
        do{
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try session.overrideOutputAudioPort(.speaker)
        try session.setActive(true)
            
        //Create settings for audio recorder
        
            var settings : [String:Any] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
            settings[AVSampleRateKey] = 44100.0
            settings[AVNumberOfChannelsKey] = 2
            
            
        //Create URL for the audio file
        
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponents = [basePath, "audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponents)
            
            print("##################")
            print(audioURL)
        
            // Create audio recorder object
        
            try audioRecorder = AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder!.prepareToRecord()
        } catch let error as NSError {
            print (error)
        }
            
        }

        
    
        
    
        
     
    
    
    @IBAction func recordButtonTapped(_ sender: Any) {
        
        if audioRecorder!.isRecording {
            //stop the recording
            audioRecorder?.stop()
            
            //change button title to record
            record.setTitle("Record", for: .normal)
        }else {
            //start the recording
            audioRecorder?.record()
            
            
            //change button title to stop
            record.setTitle("Stop", for: .normal)
        }
        
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
}
