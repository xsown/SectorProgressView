//
//  SectorProgressView.swift
//  SectorProgressView
//
//  Created by Shi Xu on 15/12/24.
//  Copyright © 2015 Shi Xu. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

class SectorProgressView: UIView {
    
    var progress:Double = 0.0
    var fillColor = UIColor(red: 0.0, green: 0, blue: 0, alpha: 0.5)
    var circleBorderWidth:CGFloat = 2.0
    var radius:CGFloat {
        get {
            return circleRadius
        }
        set {
            circleRadius = min(newValue, bounds.size.width / 2)
        }
    }
    var animationDuration:NSTimeInterval = 2.0
    
    func setProgress(progress:Double, animated:Bool) {
        if animated {
            startProgress = self.progress
            endProgress = progress
            animationStopTime = animationDuration * abs(endProgress - startProgress)
            let displayLink = CADisplayLink(target: self, selector: "updateProgress")
            startTimestamp = CACurrentMediaTime()
            displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
            self.displayLink = displayLink
        }
        else {
            self.progress = progress
            self.setNeedsDisplay()
        }
    }
    
    private var degrees:Double {
        return progress * 360.0
    }
    private lazy var circleRadius:CGFloat = self.bounds.size.height / 2 * 0.8
    private var fanRadius:CGFloat {
        return circleRadius - circleBorderWidth
    }
    private var viewCenter:CGPoint {
        return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2)
    }
    
    private var displayLink:CADisplayLink?
    private var animationStopTime:CFTimeInterval = 0.0
    private var startProgress = 0.0
    private var endProgress = 0.0
    private var startTimestamp:CFTimeInterval = 0.0
    private var timeProgress:CFTimeInterval {
        return displayLink!.timestamp - startTimestamp
    }
    
    func updateProgress() {
        progress = startProgress + timeProgress / animationStopTime * (endProgress - startProgress)
        if progress > startProgress && progress > endProgress {
            progress = endProgress
        }
        else if progress < startProgress && progress < endProgress {
            progress = endProgress
        }
        setNeedsDisplay()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColor(context, CGColorGetComponents(fillColor.CGColor))
        CGContextAddRect(context, bounds)
        CGContextAddPath(context, createCirclePath())
        CGContextAddPath(context, createFanPath())
        CGContextEOFillPath(context)
        if let displayLink = self.displayLink {
            if timeProgress > animationStopTime {
                displayLink.invalidate()
                self.displayLink = nil
            }
        }
    }
    
    private func radians(degrees:Double) -> Double {
        return degrees * M_PI / 180.0
    }
    
    private func degrees(radians:Double) -> Double {
        return radians * 180.0 / M_PI
    }
    
    private func createCirclePath() -> CGMutablePathRef {
        let path = CGPathCreateMutable()
        let startAngle = CGFloat(radians(0.0))
        let endAngle = CGFloat(radians(360.0))
        CGPathMoveToPoint(path, nil, viewCenter.x, viewCenter.y - circleRadius)
        CGPathAddArc(path, nil, viewCenter.x, viewCenter.y, circleRadius, startAngle, endAngle, false)
        return path
    }
    
    private func createFanPath() -> CGMutablePathRef {
        let startAngle = CGFloat(radians(-90.0))
        let endAngle = CGFloat(radians(degrees + 270.0))
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, viewCenter.x, 0)
        CGPathAddArc(path, nil, viewCenter.x, viewCenter.y, fanRadius, startAngle, endAngle, false)
        CGPathAddLineToPoint(path, nil, viewCenter.x, viewCenter.y)
        CGPathAddLineToPoint(path, nil, viewCenter.x, 0)
        return path
    }
    
}
