//
//  ViewController.swift
//  Animat
//
//  Created by Sharad Goyal on 16/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func initializeView() {
        let square = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        square.backgroundColor = UIColor.brown
        
        view.addSubview(square)
        
        let timing = UICubicTimingParameters(animationCurve: .easeOut)
        animator = UIViewPropertyAnimator(duration: 2.0, timingParameters: timing)
        
        animator?.addAnimations {
            square.center = CGPoint(x: 300, y: square.center.y)
            square.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_ :)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        let fractionCompleted = location.x / view.bounds.width
        
        animator?.fractionComplete = fractionCompleted
    }
    
}

