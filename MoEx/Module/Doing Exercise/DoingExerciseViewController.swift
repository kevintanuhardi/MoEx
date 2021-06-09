//
//  DoingExerciseViewController.swift
//  MoEx
//
//  Created by Randy Efan Jayaputra on 09/06/21.
//

import UIKit
import AVFoundation

class DoingExerciseViewController: UIViewController {
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var countOfExerciseLabel: UILabel!
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var repExerciseLabel: UILabel!
    
    private var counter = 3 {
        didSet {
            changeNumber()
        }
    }
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        openCamera()
        setupView()
    }
    
    func setupView() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runInterval), userInfo: nil, repeats: true)
    }
    
    func changeNumber() {
        if let layer = self.previewView.layer.sublayers?.last {
            layer.removeFromSuperlayer()
        }
        
        let newLayer = createLayerCount()
        self.previewView.layer.addSublayer(newLayer)
    }
    
    func createLayerCount() -> CALayer {
        let layerCount = CALayer()
        layerCount.frame = self.previewView.bounds
        layerCount.backgroundColor = UIColor.black.cgColor
        layerCount.opacity = 0.7
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: layerCount.bounds.width, height: 100))
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.center = self.previewView.center
        label.textAlignment = .center
        label.text = "\(counter)"
        label.isHidden = false
        label.textColor = UIColor.white
        label.layer.displayIfNeeded()
        
        layerCount.addSublayer(label.layer)
        return layerCount
    }
    
    @objc func runInterval() {
        counter -= 1
        if counter == 0 {
            if let layer = self.previewView.layer.sublayers?.last {
                layer.removeFromSuperlayer()
            }
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        
    }
    
    @IBAction func nextExercisePressed(_ sender: Any) {
        
    }
    
    @IBAction func previousExercisePressed(_ sender: Any) {
        
    }
}

extension DoingExerciseViewController {
    func openCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            self.setupAVCapture()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async { [weak self] in
                        self?.setupAVCapture()
                    }
                }
            }
        case .denied:
            print("denied")
        case .restricted:
            print("restricted")
        default:
            print("cant access the camera")
        }
    }
    
    func setupAVCapture() {
        let captureSession = AVCaptureSession()
        
        if let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                if captureSession.canAddInput(input) {
                    captureSession.addInput(input)
                }
            } catch let error {
                print("Failed to set input device with error: \(error)")
            }
        
            let cameraLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            cameraLayer.frame = self.previewView.bounds
            cameraLayer.videoGravity = .resizeAspectFill
            
            self.previewView.layer.addSublayer(cameraLayer)
            
            let layer = createLayerCount()
            self.previewView.layer.addSublayer(layer)
            self.setTimer()
            
            captureSession.startRunning()
        }
    }
}
