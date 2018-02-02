//
//  ViewController.swift
//  FindWeather
//
//  Created by Vijay Thota on 2/1/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import Weather

class ViewController: UIViewController {

    @IBOutlet weak var locationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Logic to read the last searched city
        let defaults = UserDefaults.standard
        guard let lastSearchCty : String = defaults.value(forKey: "lastSearchedCity") as? String else {
            return
        }
        
        // Displaying the last searched city
        if (lastSearchCty.count > 0) {
            locationField.text = lastSearchCty
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchLocation (_ sender: UIButton) {
        
        if (locationField.text?.isEmpty)! {
            // create the alert
            let alert = UIAlertController(title: "Error", message: "Enter the location", preferredStyle: UIAlertControllerStyle.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        } else {
            // Get the user input
            let location = locationField.text
            
            // Perform the weather search for the given location
            let weather = Weather()
            
            weather.doWeatherSearch(location: location!, withCompletion: { (data) -> Void in
                if (data.name.isEmpty) {
                    DispatchQueue.main.async {
                        // create the alert
                        let alert = UIAlertController(title: "Error", message: "No location found", preferredStyle: UIAlertControllerStyle.alert)
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        // Instantiate the Weather Details object
                        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "weatherDetails") as! WeatherDetails
                        
                        // Set the received data to the ivars
                        detailsVC.name = data.name
                        detailsVC.shortDesc = data.shotDesc
                        detailsVC.longDesc = data.longDesc
                        detailsVC.speed = "\(data.windSpeed)"
                        detailsVC.sunrise = "\(data.sunrise)"
                        detailsVC.sunset = "\(data.sunset)"
                        detailsVC.imageURLStr = data.icon
                        
                        // Present the details screen
                        self.present(detailsVC, animated: true, completion: {
                            // Store the recent search
                            let defaults = UserDefaults.standard
                            defaults.setValue(self.locationField.text, forKey: "lastSearchedCity")
                        })
                    }
                }
            })
        }
    }
}

