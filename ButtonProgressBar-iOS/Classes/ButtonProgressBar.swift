//
//  ButtonProgressBar.swift
//  ButtonProgressBar-iOS
//
//  Created by Pushkar Sharma on 08/04/2017.
//  Copyright © 2017 thePsguy. All rights reserved.
//

import UIKit

public class ButtonProgressBar: UIButton {
    
    private var cornerRadius: CGFloat = 5
    public private(set) var progress: CGFloat = 0.0
    
    var indeterminate: Bool = false
    
    private let progressLayer = CAShapeLayer()
    
    private var progressColor = UIColor(red: 0/255, green: 99/255, blue: 245/255, alpha: 1.0)
    
    private var timer: Timer?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 50/255, green: 100/255, blue: 200/255, alpha: 1.0)
        
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        titleLabel!.textAlignment = .center
        titleLabel!.textColor = .white
        titleLabel!.font = UIFont.boldSystemFont(ofSize: 0)
        
        progressLayer.path = rectanglePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        
        progressLayer.strokeEnd = 0.0
        progressLayer.lineWidth = frame.height*2
        
        progressLayer.strokeEnd = 0.0
        
        layer.addSublayer(progressLayer)
        self.bringSubview(toFront: titleLabel!)
    }
    
    
    public func startIndeterminate(withTimePeriod time: TimeInterval, andTimePadding padding: TimeInterval = 0.5) {
        timer?.invalidate()
        self.resetProgress()
        timer = Timer.scheduledTimer(timeInterval: time,
                                     target: self,
                                     selector: #selector(self.animateIndeterminate),
                                     userInfo: padding,
                                     repeats: true)
        timer?.fire()
        RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
    }
    
//    public func startIndeterminate(withTimePeriod time: TimeInterval) {
//        startIndeterminate(withTimePeriod: time, andTimePadding: 0.5)
//    }
    
    func animateIndeterminate(sender: Timer) {
        let time = sender.timeInterval - (sender.userInfo as! Double)
        let stroke = CABasicAnimation(keyPath: "strokeEnd")
        stroke.fromValue = 0.0
        stroke.toValue = 0.5
        stroke.duration = time
        stroke.fillMode = kCAFillModeForwards
        stroke.isRemovedOnCompletion = false
        stroke.timingFunction = CAMediaTimingFunction(controlPoints: 1, 0, 1, 1)
        self.progressLayer.add(stroke, forKey: nil)
    }
    
    public func startIndeterminate(){
        startIndeterminate(withTimePeriod: 2.0)
    }
    
    public func stopIndeterminate() {
        timer?.invalidate()
    }
    
    public func resetProgress() {
        self.setProgress(progress: 0.0, false)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        titleLabel!.frame = self.bounds
        titleLabel!.font = titleLabel!.font.withSize(titleLabel!.frame.height * 0.45)
    }
    
    public func setProgress(progress: CGFloat, _ animated: Bool) {
        if !animated {
            progressLayer.strokeEnd = progress / 2
        }
        else {
            let stroke = CABasicAnimation(keyPath: "strokeEnd")
            stroke.fromValue = self.progress
            stroke.toValue = progress
            stroke.fillMode = kCAFillModeForwards
            stroke.isRemovedOnCompletion = false
            stroke.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            self.progressLayer.add(stroke, forKey: nil)
        }
        self.progress = progress
    }
    
    func setProgressColor(color: UIColor) {
        self.progressColor = color
        self.progressLayer.strokeColor = color.cgColor
    }

    func setBackgroundColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.05) {
            self.titleLabel!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            self.alpha = 0.85
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.titleLabel!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.alpha = 1.0
        }
    }
    
}
