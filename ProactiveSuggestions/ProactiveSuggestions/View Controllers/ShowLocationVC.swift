//
//  ShowLocationVC.swift
//  ProactivrSuggestions
//
//  Created by Prianka Liz Kariat on 1/9/17.
//  Copyright © 2017 Prianka Liz Kariat. All rights reserved.
//

import UIKit
import MapKit
import CoreSpotlight

class ShowLocationVC: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tagLabel: UILabel!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var navigationBar: UINavigationBar!
  
  var activity: NSUserActivity?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func restoreUserActivityState(_ activity: NSUserActivity) {
    
    self.activity = activity
    
    super.restoreUserActivityState(activity)
  
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
    
    navigationBar.topItem?.title = self.activity?.title

    if let hashTags = self.activity?.userInfo?["tags"] as? [String] {

      tagLabel.text = hashTags.joined(separator: " ")
      
    }
    if let latitude = self.activity?.userInfo?["latitude"] as? NSNumber, let longitude = self.activity?.userInfo?["longitude"] as? NSNumber {
      
      let annotation = MKPointAnnotation()
      let centerCoordinate = CLLocationCoordinate2D(latitude: latitude.doubleValue, longitude:longitude.doubleValue)

      let region = MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
      
      mapView.setRegion(region, animated: false)

      annotation.coordinate = centerCoordinate
      annotation.title = titleLabel.text
      mapView.addAnnotation(annotation)
    }

  }
  @IBAction func onClickDoneButton(_ sender: AnyObject) {
    
    dismiss(animated: true, completion: nil)
  }

}
