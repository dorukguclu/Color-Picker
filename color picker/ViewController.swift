//
//  ViewController.swift
//  color picker
//
//  Created by Doruk GÜÇLÜ on 29.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
   
    // Action for reset button
    @IBAction func reset(_ sender: Any) {
        // Set all sliders to 1
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        // Turn off all switches
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        // Update the color view based on the reset values
        updateColor()
        updateControls()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize color and background when view loads
        updateColor()
        updateControls()
        
        colorView.backgroundColor = .black
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor =
           UIColor.black.cgColor
    }
    
    @IBAction func UISwitch(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        // Set color components based on switch states
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        // Set the color of the colorView
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    
    @IBAction func sliderChanged(_ sender: Any) {
        updateColor()
    }
}
