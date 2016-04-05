//
//  ViewController.swift
//  EMILYlingo
//
//  Created by Esteban Solis on 3/31/16.
//  Copyright © 2016 EMILYlingo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, AVAudioRecorderDelegate, EZMicrophoneDelegate {
    
    //------------------------------------------------------------------------------
    // MARK: Properties
    //------------------------------------------------------------------------------
    @IBOutlet weak var plot: EZAudioPlotGL?;
    var microphone: EZMicrophone!;
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var TimerLabel: UILabel!
    
    
    var audioURL: NSURL!
    var recordingSession: AVAudioSession!
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder!
    
    var timer = 30
    var count = 2
    var check = false;
    var TimerControl = NSTimer()
    
    
    //------------------------------------------------------------------------------
    // MARK: Status Bar Style
    //------------------------------------------------------------------------------
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }
    
    //------------------------------------------------------------------------------
    // MARK: View Lifecycle
    //------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        microphone = EZMicrophone(delegate: self, startsImmediately: true);
        plot?.backgroundColor = UIColor.blackColor()
        let plotType: EZPlotType = EZPlotType.Buffer
        plot?.plotType = plotType
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission(){[unowned self] (allowed: Bool) -> Void in
                dispatch_async(dispatch_get_main_queue()){
                    if allowed {
                        self.loadRecordingUI()
                    }else {
                        
                    }
                }
            }
        }catch {
            
        }
        
    }
    
    func loadRecordingUI(){
        if count == 1 {
            check = true
            if let image = UIImage(named: "RecordingOn.png") {
                plot?.shouldFill = true
                plot?.shouldMirror = true
                //plot?.resumeDrawing()
                TimerControl = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)
                count = 2
                RecordButton.setImage(image, forState: .Normal)
                startRecording()
            }
        }else {
            if let image = UIImage(named: "RecordOff.png") {
                //plot?.pauseDrawing()
                count = 1
                timer = 30
                TimerLabel.text = String(timer)
                TimerControl.invalidate()
                RecordButton.setImage(image, forState: .Normal)
                if(check == true){
                    finishRecording()
                }
            }
        }
    }
    
    func startRecording(){
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        let audioFilename = documentsDirectory.stringByAppendingString("recording.m4a")
        audioURL = NSURL(fileURLWithPath: audioFilename)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000.0,
            AVNumberOfChannelsKey: 1 as NSNumber,
            AVEncoderAudioQualityKey: AVAudioQuality.High.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(URL: audioURL, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            let plotType: EZPlotType = EZPlotType.Buffer
            plot?.plotType = plotType;
            plot?.shouldFill = true
            plot?.shouldMirror = true
            
        }catch {
            finishRecording()
        }
    }
    
    func finishRecording(){
        audioRecorder.stop()
        audioRecorder = nil
        check = false
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: audioURL)
            audioPlayer = sound
            sound.play()
            //RecordButton.enabled = false
            //plot?.resumeDrawing()
        }catch{
            
        }
        plot?.shouldMirror = false
        plot?.shouldFill = false
        plot?.clear()
        
    }

    @IBAction func RecordAndStop(sender: AnyObject) {
        loadRecordingUI()
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording()
        }
    }
    
    func countdown(){
        if(timer >= 0){
            timer = timer - 1
            TimerLabel.text = String(timer)
        }
    }
    
    func savePhrase(){
        
    }
    
    //------------------------------------------------------------------------------
    // MARK: Actions
    //------------------------------------------------------------------------------
    
    
    //------------------------------------------------------------------------------
    // MARK: EZMicrophoneDelegate
    //------------------------------------------------------------------------------
    
    func microphone(microphone: EZMicrophone!, hasAudioReceived buffer: UnsafeMutablePointer<UnsafeMutablePointer<Float>>, withBufferSize bufferSize: UInt32, withNumberOfChannels numberOfChannels: UInt32) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.plot?.updateBuffer(buffer[0], withBufferSize: bufferSize);
        });
    }
    
}