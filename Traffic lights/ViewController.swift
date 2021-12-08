//
//  ViewController.swift
//  Traffic lights
//
//  Created by dasha on 08.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowLabel: UIView!
    @IBOutlet weak var greenLabel: UIView!
    @IBOutlet weak var startButton: UIButton!
    var currentTrafficLightsState: TrafficLightsState = .off {
        didSet {
            switch currentTrafficLightsState {
            case .red:
                redView.alpha = 1
                yellowLabel.alpha = 0.3
                greenLabel.alpha = 0.3
            case .yellow:
                redView.alpha = 0.3
                yellowLabel.alpha = 1
                greenLabel.alpha = 0.3
            case .green:
                redView.alpha = 0.3
                yellowLabel.alpha = 0.3
                greenLabel.alpha = 1
            case .off:
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redView.alpha = 0.3
        yellowLabel.alpha = 0.3
        greenLabel.alpha = 0.3
        redView.layer.cornerRadius = 130 / 2
        yellowLabel.layer.cornerRadius = 130 / 2
        greenLabel.layer.cornerRadius = 130 / 2
        startButton.layer.cornerRadius = 10
    }
    

    @IBAction func startPressed(_ sender: UIButton) {
        startButton.setTitle("NEXT", for: .normal)
        if currentTrafficLightsState == .off {
            currentTrafficLightsState = .red
        } else if currentTrafficLightsState == .red {
            currentTrafficLightsState = .yellow
        } else if currentTrafficLightsState == .yellow {
            currentTrafficLightsState = .green
        } else if currentTrafficLightsState == .green {
            currentTrafficLightsState = .red
        }
    }
}

enum TrafficLightsState {
    case red
    case yellow
    case green
    case off
}
