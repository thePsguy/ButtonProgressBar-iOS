//
//  ViewController.swift
//  ButtonProgressBar-iOS
//
//  Created by Pushkar Sharma on 08/04/2017.
//  Copyright © 2017 thePsguy. All rights reserved.
//

import UIKit
import ButtonProgressBar_iOS

class ViewController: UIViewController {
    
    var progressButton: ButtonProgressBar!
    var typeSelector: UITextField!
    
    var picker: UIPickerView!
    
    var timePeriod: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressButton = ButtonProgressBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width*0.8, height: 45))
        progressButton.center = self.view.center
        
        progressButton.addTarget(nil, action: #selector(self.tapped), for: .touchUpInside)
        progressButton.label.text = "DOWNLOAD"
        
        picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(0, inComponent: 0, animated: true)
        
        typeSelector = UITextField(frame: CGRect(x: 24, y: 54, width: self.view.frame.width - 48, height: 27))
        typeSelector.textAlignment = .center
        typeSelector.inputView = picker
        typeSelector.text = "Indeterminate"
        typeSelector.borderStyle = .line
        
        timePeriod = UITextField(frame: CGRect(x: self.view.frame.width / 2 - 25, y: 120, width: 50, height: 27))
        timePeriod.textAlignment = .center
        timePeriod.keyboardType = .numberPad
        timePeriod.borderStyle = .line
        
        self.view.addSubview(timePeriod)
        self.view.addSubview(typeSelector)
        self.view.addSubview(progressButton)
    }
    
    func tapped(){
        let time = Double(timePeriod.text != "" ? timePeriod.text! : "1")!
        picker.selectedRow(inComponent: 0) == 0 ? self.progressButton.startIndeterminate(withTimePeriod: time) : self.loadDeterminate()
    }
    
    func loadDeterminate() {
        self.progressButton.stopIndeterminate()
        self.progressButton.resetProgress()
        let timer = Timer.scheduledTimer(timeInterval: 0.03,
                                         target: self,
                                         selector: #selector(self.animateDeterminate),
                                         userInfo: time,
                                         repeats: true)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    func animateDeterminate(sender: Timer) {
        if self.progressButton.progress >= 1.0 {
            sender.invalidate()
        }
        else {
            self.progressButton.setProgress(progress: self.progressButton.progress + CGFloat(0.02))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "Indeterminate" : "Determinate"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeSelector.text = row == 0 ? "Indeterminate" : "Determinate"
        typeSelector.resignFirstResponder()
    }
    
}
