//
//  StupidStepViewController.swift
//  Ridiculous Step Counter
//
//  Created by Miguel Sicart on 03/07/2020.
//  Copyright © 2020 Miguel Sicart. All rights reserved.
//

import UIKit
import CoreMotion

class StupidStepViewController: UIViewController
{
    //MARK: - Outlets
    
    @IBOutlet weak var stepsLabels: UILabel!
    @IBOutlet weak var walkingStatusLabel: UILabel!
    @IBOutlet weak var debugLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    //MARK: - Motion Manager
    var motionManager = CMMotionManager()
    
    //MARK: - Filtering variables
    var accelerationThreshold: Double!
    
    //MARK: - Step Counter Variables
    var steps: Int!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        accelerationThreshold = 1
        steps = 0
        self.walkingStatusLabel.text = String(accelerationThreshold)
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!, withHandler: {deviceManager, error in
            let userAcceleration:CMAcceleration = deviceManager!.userAcceleration
            
            if fabs(userAcceleration.x) > self.accelerationThreshold || fabs(userAcceleration.y) > self.accelerationThreshold || fabs(userAcceleration.z) > self.accelerationThreshold
            {
                self.debugLabel.text = "Low Pass filter success!"
                self.steps += 1
                self.stepsLabels.text = String(self.steps)
            }
            
        })
    }
    


}
