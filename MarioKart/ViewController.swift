//
//  ViewController.swift
//  MarioKart
//
//  Created by Daniel Ochoa Aguila on 2/20/19.
//  Copyright © 2019 Daniel Ochoa Aguila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kartView0: UIImageView!
    @IBOutlet weak var kartView1: UIImageView!
    @IBOutlet weak var kartView2: UIImageView!
    
    var startingPointKartView0 = CGPoint()
    var startingPointKartView1 = CGPoint()
    var startingPointKartView2 = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingPointKartView0 = kartView0.center
        startingPointKartView1 = kartView1.center
        startingPointKartView2 = kartView2.center
    }

    @IBAction func didLongPressBackground(_ sender: UILongPressGestureRecognizer) {
        UIView.animate(withDuration: 0.8) {
            self.kartView0.center = self.startingPointKartView0
            self.kartView1.center = self.startingPointKartView1
            self.kartView2.center = self.startingPointKartView2
            
            self.kartView0.transform = CGAffineTransform.identity
            self.kartView1.transform = CGAffineTransform.identity
            self.kartView2.transform = CGAffineTransform.identity
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didPanKartView(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        print("Location: x: \(location.x), y: \(location.y)")
        let kartView = sender.view!
        kartView.center = location
    }
    
    @IBAction func didTapKartView(_ sender: UITapGestureRecognizer) {
        print("Double tap recognized")
        let kartView = sender.view!
        UIView.animate(withDuration: 0.8) {
            kartView.center.x += 500
        }

    }
    
    @IBAction func didPinchKartView(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print("scale: \(scale)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    @IBAction func didRotateKartView(_ sender: UIRotationGestureRecognizer) {
        let rotation = sender.rotation
        print("rotation: \(rotation)")
        let kartView = sender.view!
        kartView.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
}

