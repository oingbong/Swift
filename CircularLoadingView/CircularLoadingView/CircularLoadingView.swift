//
//  CircularLoadingView.swift
//  CircularLoadingView
//
//  Created by Dkbmc Developer on 2017. 8. 23..
//  Copyright © 2017년 oingbong. All rights reserved.
//

import UIKit

class CircularLoadingView: UIView, CAAnimationDelegate {

    let circlePathLayer = CAShapeLayer()
    let circleRadius : CGFloat = 20
    
    var progress : CGFloat {
        get {
            return circlePathLayer.strokeEnd
        }
        set {
            if newValue > 1 {
                circlePathLayer.strokeEnd = 1
            }else if newValue < 0 {
                circlePathLayer.strokeEnd = 0
            }else {
                circlePathLayer.strokeEnd = newValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure(){
        progress = 0 // Add this later on
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = 2
        circlePathLayer.fillColor = UIColor.green.cgColor
        circlePathLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(circlePathLayer)
        backgroundColor = .white
    }
    
    func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        circleFrame.origin.x = circlePathLayer.bounds.midX - circleFrame.midX
        circleFrame.origin.y = circlePathLayer.bounds.midY - circleFrame.midY
        return circleFrame
    }
    
    //get the circle path
    func circlePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circlePathLayer.frame = bounds
        circlePathLayer.path = circlePath().cgPath
    }
    
    func reveal(){
        backgroundColor = .clear
        progress = 1
        circlePathLayer.removeAnimation(forKey: "strokeEnd")
        circlePathLayer.removeFromSuperlayer()
        superview?.layer.mask = circlePathLayer
        
        //
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let finalRadius = sqrt((center.x*center.x) + (center.y*center.y))
        let radiusInset = finalRadius - circleRadius
        let outerRect = circleFrame().insetBy(dx: -radiusInset, dy: -radiusInset)
        let toPath = UIBezierPath(ovalIn: outerRect).cgPath
        
        print("center : \(center)")
        print("finalRadius : \(finalRadius)")
        print("radiusInset : \(radiusInset)")
        print("outerRect : \(outerRect)")
        print("toPath : \(toPath)")
        
        //
        let fromPath = circlePathLayer.path
        let fromLineWidth = circlePathLayer.lineWidth
        
        //
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        circlePathLayer.lineWidth = 2*finalRadius
        circlePathLayer.path = toPath
        CATransaction.commit()
        
        //
        let lineWidthAnimation = CABasicAnimation(keyPath : "lineWidth")
        lineWidthAnimation.fromValue = fromLineWidth
        lineWidthAnimation.toValue = 2*finalRadius
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = fromPath
        pathAnimation.toValue = toPath
        
        //
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 1
        groupAnimation.timingFunction = CAMediaTimingFunction(name : kCAMediaTimingFunctionEaseInEaseOut)
        groupAnimation.animations = [pathAnimation, lineWidthAnimation]
        groupAnimation.delegate = self
        circlePathLayer.add(groupAnimation, forKey: "strokeWidth")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        superview?.layer.mask = nil
    }

}
