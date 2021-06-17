//
//  DoingExerciseViewController.swift
//  MoEx
//
//  Created by Randy Efan Jayaputra on 09/06/21.
//

import UIKit
import AVFoundation
import Vision

class DoingExerciseViewController: UIViewController {
    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var countOfExerciseLabel: UILabel!
    @IBOutlet weak var exerciseTitleLabel: UILabel!
    @IBOutlet weak var repExerciseLabel: UILabel!
    @IBOutlet weak var previousView: UIView!
    @IBOutlet weak var nextView: UIView!
    
    let captureSession = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    let queue = DispatchQueue(label: "camera.queue")
    private var bodyProcessor = BodyPoseProcessor()
    var isPausedVideo: Bool = false
    private var bodyPoseRequest = VNDetectHumanBodyPoseRequest()
    var module: ModuleModel?
    var exercise: Exercise?
    var index: Int?
    
    var reps: Int = 0
    
    private var counter = 3 {
        didSet {
            changeNumber()
        }
    }
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        openCamera()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
        setupButtonIndex()
    }
    
    func setupView() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        guard let module = module, let exercise = exercise, let index = index else { return }
        countOfExerciseLabel.text = "\(index+1) of \(module.exercise.count)"
        exerciseTitleLabel.text = exercise.title
        repExerciseLabel.text = "\(reps)/\(exercise.reps)"
    }
    
    func setupButtonIndex() {
        guard let index = index, let module = module else { return }
        if index == 0 {
            previousView.alpha = 0
        } else if index == module.exercise.count - 1 {
            nextView.alpha = 0
        } else {
            previousView.alpha = 1
            nextView.alpha = 1
        }
    }
    
    func setupButtonPreviewLayer() {
        let camera = UIButton(frame: CGRect(x: self.previewView.bounds.maxX - 40, y: self.previewView.bounds.maxY - 40, width: 32, height: 32))
        camera.setImage(UIImage(named: "ic_video"), for: .normal)
        camera.addTarget(self, action: #selector(cameraPressed), for: .touchUpInside)
        previewView.addSubview(camera)
        
        let sound = UIButton(frame: CGRect(x: self.previewView.bounds.minX + 8, y: self.previewView.bounds.height - 40, width: 32, height: 32))
        sound.setImage(UIImage(named: "ic_sound"), for: .normal)
        sound.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
        previewView.addSubview(sound)
        
        let dismiss = UIButton(frame: CGRect(x: self.previewView.bounds.minX + 8, y: self.view.safeAreaInsets.top + 16, width: 32, height: 32))
        dismiss.setImage(UIImage(named: "ic_x"), for: .normal)
        dismiss.addTarget(self, action: #selector(stopPressed), for: .touchUpInside)
        previewView.addSubview(dismiss)
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
    
    func navigateToPauseView() {
        let vc = PauseExerciseViewController()
        let navVc = UINavigationController(rootViewController: vc)
        navVc.modalPresentationStyle = .fullScreen
        vc.onTapQuit = {
            self.navigationController?.popToRootViewController(animated: true)
        }
        self.navigationController?.present(navVc, animated: true, completion: nil)
    }
    
    func navigateToBreakExercise() {
        guard let index = index, let module = module else { return }
        let nextExercise = index + 1
        if nextExercise < module.exercise.count {
            let vc = BreakExerciseViewController()
            vc.moduleModel = module
            vc.exerciseIndex = nextExercise
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = FinishExerciseViewController()
            vc.moduleModel = module
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func cameraPressed() {
        if !isPausedVideo {
            isPausedVideo = !isPausedVideo
            let view = UIView(frame: previewView.bounds)
            view.backgroundColor = UIColor.black
            view.tag = 1
            previewView.insertSubview(view, at: 1)
        } else {
            isPausedVideo = !isPausedVideo
            if let view = previewView.viewWithTag(1) {
                view.removeFromSuperview()
            }
        }
    }
    
    @objc func soundPressed() {
    
    }
    
    @objc func stopPressed() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func runInterval() {
        counter -= 1
        if counter == 0 {
            if let layer = self.previewView.layer.sublayers?.last {
                layer.removeFromSuperlayer()
                setupButtonPreviewLayer()
            }
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func pausePressed(_ sender: Any) {
        navigateToPauseView()
    }
    
    @IBAction func nextExercisePressed(_ sender: Any) {
        navigateToBreakExercise()
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
        if let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                if captureSession.canAddInput(input) {
                    captureSession.addInput(input)
                }
            } catch let error {
                print("Failed to set input device with error: \(error)")
            }
            
            videoOutput.alwaysDiscardsLateVideoFrames = true
            videoOutput.setSampleBufferDelegate(self, queue: queue)
            if captureSession.canAddOutput(videoOutput) {
                captureSession.addOutput(videoOutput)
            }
            
            let cameraLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            cameraLayer.frame = self.previewView.bounds
            cameraLayer.videoGravity = .resizeAspectFill
            
            self.previewView.layer.addSublayer(cameraLayer)
            
            let layer = createLayerCount()
            self.previewView.layer.addSublayer(layer)
            self.setTimer()
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.captureSession.startRunning()
            }
        }
    }
    func processPoint(rightShoulder: CGPoint?, rightWrist: CGPoint?, rightElbow: CGPoint?, rightHip: CGPoint?, rightAnkle: CGPoint?, rightKnee: CGPoint?){
        guard let rightShoulder = rightShoulder, let rightWrist = rightWrist, let rightElbow = rightElbow, let rightHip = rightHip, let rightAnkle = rightAnkle, let rightKnee = rightKnee else {
            return
        }
        
//        let previewLayer = previewView.previewLayer
//        let shoulderPointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightShoulder)
//        let wristPointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightWrist)
//        let elbowPointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightElbow)
//        let hipPointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightHip)
//        let anklePointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightAnkle)
//        let kneePointConverted = previewLayer.layerPointConverted(fromCaptureDevicePoint: rightKnee)

//        bodyProcessor.processPoints((elbowPointConverted, wristPointConverted, shoulderPointConverted))
    }
}

extension DoingExerciseViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Throw the logic to handle output video frame to our posenet model
        var rightShoulder: CGPoint?
        var rightWrist: CGPoint?
        var rightElbow: CGPoint?
        var rightHip: CGPoint?
        var rightAnkle: CGPoint?
        var rightKnee: CGPoint?

        defer{
            DispatchQueue.main.async {
                self.processPoint(rightShoulder: rightShoulder, rightWrist: rightWrist, rightElbow: rightElbow, rightHip: rightHip, rightAnkle: rightAnkle, rightKnee: rightKnee)
            }
        }

        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])

        do {
            try handler.perform([bodyPoseRequest])
            guard let observation = bodyPoseRequest.results?.first else {return}

            let shoulderPoint = try observation.recognizedPoint(.rightShoulder)
            let wristPoint = try observation.recognizedPoint(.rightWrist)
            let elbowPoint = try observation.recognizedPoint(.rightElbow)
            let hipPoint = try observation.recognizedPoint(.rightHip)
            let anklePoint = try observation.recognizedPoint(.rightAnkle)
            let kneePoint = try observation.recognizedPoint(.rightKnee)
         
            guard shoulderPoint.confidence > 0.3 || wristPoint.confidence > 0.3 || elbowPoint.confidence > 0.3 || hipPoint.confidence > 0.3 || anklePoint.confidence > 0.3 || kneePoint.confidence > 0.3 else {return}
            
//            print("shoulderpoint",shoulderPoint)
//            print("wristpoint",wristPoint)

            rightShoulder = CGPoint(x: shoulderPoint.location.x, y: 1 - shoulderPoint.location.y)
            rightWrist = CGPoint(x: wristPoint.location.x, y: 1 - wristPoint.location.y)
            rightElbow = CGPoint(x: elbowPoint.location.x, y: 1 - elbowPoint.location.y)
            rightHip = CGPoint(x: hipPoint.location.x, y: 1 - hipPoint.location.y)
            rightAnkle = CGPoint(x: anklePoint.location.x, y: 1 - anklePoint.location.y)
            rightKnee = CGPoint(x: kneePoint.location.x, y: 1 - kneePoint.location.y)
           

        } catch {
            captureSession.stopRunning()
        }
    }
}
