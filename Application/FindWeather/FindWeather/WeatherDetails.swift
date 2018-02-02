//
//  WeatherDetails.swift
//  FindWeather
//
//  Created by Vijay Thota on 2/1/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetails : UIViewController {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var shortDescLabel: UILabel?
    @IBOutlet weak var longDescLabel: UILabel?
    @IBOutlet weak var speedLabel: UILabel?
    @IBOutlet weak var sunriseLabel: UILabel?
    @IBOutlet weak var sunsetLabel: UILabel?
    @IBOutlet weak var icon: UIImageView?

    var name = String()
    var shortDesc = String()
    var longDesc = String()
    var speed = String()
    var sunrise = String()
    var sunset = String()
    var imageURLStr = String()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Loading the data
        self.nameLabel?.text = self.name
        self.shortDescLabel?.text = self.shortDesc
        self.longDescLabel?.text = self.longDesc
        self.speedLabel?.text = self.speed
        self.sunriseLabel?.text = self.sunrise
        self.sunsetLabel?.text = self.sunset
        
        let imageURLstring  = self.imageURLStr
        
        guard let imageUrl:URL = URL(string: imageURLstring) else {
            print("Return 1 \(imageURLstring)")
            return
        }
        guard let imageData:NSData = NSData(contentsOf: imageUrl) else {
            print("Return 2")
            return
        }
        guard let image = UIImage(data: imageData as Data) else {
            print("Return 3")
            return
        }
        self.icon?.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Closing the detail screen
    @IBAction func done (_ sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
}
