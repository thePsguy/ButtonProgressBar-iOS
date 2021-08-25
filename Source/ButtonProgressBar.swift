/*
Copyright (c) 2017 Pushkar Sharma <thePsguy@icloud.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

import UIKit

public class ButtonProgressBar: UIButton {
    
    private var cornerRadius: CGFloat = 5
    public private(set) var progress: CGFloat = 0.0
    
    var indeterminate: Bool = false
    
    private let progressLayer = CAShapeLayer()
    
    private var progressColor = UIColor(red: 0/255, green: 140/255, blue: 245/255, alpha: 1.0)
    
    private var timer: Timer?
    
    /**
     Initialize programmaticaly just like you would any other UIButton.
    */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 50/255, green: 100/255, blue: 200/255, alpha: 1.0)
        
        titleLabel!.textAlignment = .center
        titleLabel!.textColor = .white
        titleLabel!.font = UIFont.boldSystemFont(ofSize: 0)
        
        imageView?.contentMode = .center
        imageView?.tintColor = .white
        self.hideImage(true)

        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))

        progressLayer.path = rectanglePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        
        progressLayer.strokeEnd = 0.0
        progressLayer.lineWidth = frame.height*2
        
        layer.addSublayer(progressLayer)
        self.bringSubviewToFront(titleLabel!)
        self.bringSubviewToFront(imageView!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 50/255, green: 100/255, blue: 200/255, alpha: 1.0)
        
        titleLabel!.textAlignment = .center
        titleLabel!.textColor = .white
        titleLabel!.font = UIFont.boldSystemFont(ofSize: 0)
        
        imageView?.contentMode = .center
        imageView?.tintColor = .white
        self.hideImage(true)
        
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        progressLayer.path = rectanglePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        
        progressLayer.strokeEnd = 0.0
        progressLayer.lineWidth = frame.height*2
        
        layer.addSublayer(progressLayer)
        self.bringSubviewToFront(titleLabel!)
        self.bringSubviewToFront(imageView!)
    }
    
    /**
     Used to handle indeterminate loading.
     - Parameter timePeriod (optional): The total time (animation + padding, default 2.0) that 1 cycle of the loading takes.
     - Parameter timePadding (optional): The duration (default 0.5), in seconds, before starting the next cycle.
    */
    public func startIndeterminate(withTimePeriod time: TimeInterval = 2.0, andTimePadding padding: TimeInterval = 0.5) {
        timer?.invalidate()
        self.resetProgress()
        timer = Timer.scheduledTimer(timeInterval: time,
                                     target: self,
                                     selector: #selector(self.animateIndeterminate),
                                     userInfo: padding,
                                     repeats: true)
        timer?.fire()
        RunLoop.current.add(timer!, forMode: RunLoop.Mode.default)
    }
    
    @objc func animateIndeterminate(sender: Timer) {
        let time = sender.timeInterval - (sender.userInfo as! Double)
        let stroke = CABasicAnimation(keyPath: "strokeEnd")
        stroke.fromValue = 0.0
        stroke.toValue = 0.5
        stroke.duration = time
        stroke.fillMode = CAMediaTimingFillMode.forwards
        stroke.isRemovedOnCompletion = false
        stroke.timingFunction = CAMediaTimingFunction(controlPoints: 1, 0, 1, 1)
        self.progressLayer.add(stroke, forKey: nil)
    }
    
    /**
     Stop indeterminate loading.
    */
    public func stopIndeterminate() {
        timer?.invalidate()
    }
    
    /**
     Reset progress to 0.0 unanimated.
     See `setProgress(progress:,animated:)` to set progress animated.
    */
    public func resetProgress() {
        self.hideImage(true)
        self.hideTitle(false)
        self.setProgress(progress: 0.0, false)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        titleLabel!.frame = self.bounds
        titleLabel!.font = titleLabel!.font.withSize(titleLabel!.frame.height * 0.45)
        imageView?.frame = self.bounds
    }
    
    /**
     Set the absolute progress value.
     - Parameter progreaa: Ranges from 0.0 to 1.0
     - Parameter animated: If true, linearly animates to target progress value.
    */
    public func setProgress(progress: CGFloat, _ animated: Bool) {
        if !animated {
            progressLayer.strokeEnd = progress / 2
        }
        else {
            let stroke = CABasicAnimation(keyPath: "strokeEnd")
            stroke.fromValue = self.progress
            stroke.toValue = progress
            stroke.fillMode = CAMediaTimingFillMode.forwards
            stroke.isRemovedOnCompletion = false
            stroke.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            self.progressLayer.add(stroke, forKey: nil)
        }
        self.progress = progress
    }
    
    /**
        Set title label text.
    */
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
    }
    
    /**
     Show / Hide title text.
     - Parameter _ hidden: Title hiddden if true, shown if false. 
     */
    public func hideTitle(_ hidden: Bool) {
        titleLabel!.layer.opacity = hidden ? 0.0 : 1.0
    }
    
    /**
     Show / Hide image.
     - Parameter hidden: Title hiddden if true, shown if false.
     */
    public func hideImage(_ hidden: Bool) {
        if hidden {
            self.imageView?.layer.removeAllAnimations()
            imageView?.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        } else {
            let completionAnim = CABasicAnimation()
            completionAnim.keyPath = "transform"
            completionAnim.fromValue = CATransform3DMakeScale(0.0, 0.0, 0.0)
            completionAnim.toValue = CATransform3DIdentity
            completionAnim.fillMode = CAMediaTimingFillMode.forwards
            completionAnim.isRemovedOnCompletion = false
            completionAnim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            self.imageView?.layer.add(completionAnim, forKey: nil)
        }
    }
    
    /**
     Stop indeterminate loading if active, set progress to 1.0 animated, and display completion checkmark.
     Needs to be called explicitly when loading determinate as well.
    */
    public func triggerCompletion() {
        self.stopIndeterminate()
        self.setProgress(progress: 1.0, true)
        self.hideTitle(true)
        self.hideImage(false)
    }
    
    
    /**
     Sets the image shown on loading completion.
     - Parameter image: UIImage to be shown on completion.
     
     NOTE: This image must be set. No default exists.
    */
    
    public func setCompletionImage(image: UIImage) {
        self.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
    }
    
    /**
     Set progress layer color.
    */
    public func setProgressColor(color: UIColor) {
        self.progressColor = color
        self.progressLayer.strokeColor = color.cgColor
    }

    /**
     Set button background color.
     */
    public func setBackgroundColor(color: UIColor) {
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
