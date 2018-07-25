//
//  ViewController.swift
//  ProactivrSuggestions
//
//  Created by Prianka Liz Kariat on 10/25/16.
//  Copyright © 2016 Prianka Liz Kariat. All rights reserved.
//

import UIKit
import MapKit
import CoreSpotlight
import MobileCoreServices

class TagLocationVC: UIViewController {
  
  var activity: NSUserActivity?
  var prevActivity: NSUserActivity?
  var currentFirstResponder: UITextField?
  lazy var locationManager = CLLocationManager()

  @IBOutlet weak var navigationBar: UINavigationBar!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var hashTagsField: UITextField!
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationBar.topItem?.title = "Tag a Location"
    
    locationManager.delegate = self
    titleTextField.delegate = self
    hashTagsField.delegate = self
    
    print(CLLocationManager.authorizationStatus())
    
    NotificationCenter.default.addObserver(self, selector: #selector(TagLocationVC.keyBoardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    
    NotificationCenter.default.addObserver(self, selector: #selector(TagLocationVC.keyBoardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    
       // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    setUpLocationManager()

  }
  
  override func restoreUserActivityState(_ activity: NSUserActivity) {
    
    prevActivity = activity
    performSegue(withIdentifier: "VC_ShowLocationVC", sender: self)
    super.restoreUserActivityState(activity)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let showLocationVC = segue.destination as! ShowLocationVC
    
    if let activity = prevActivity {
      showLocationVC.restoreUserActivityState(activity)
    }
  }
  
  @IBAction func onClickRecordActivity(_ sender: AnyObject) {
  
    extractParamsForActivityAndRecord()
  }
  
  func keyBoardWillShow(notification: Notification) {
    
    guard let currentFirstResponder = currentFirstResponder else {
      
      return
    }
    let info = notification.userInfo
    let frame =  info?[UIKeyboardFrameBeginUserInfoKey] as! NSValue
    var offset = scrollView.contentOffset
    let keyboardFrame = frame.cgRectValue
    
    let keyBoardY = view.frame.maxY - navigationBar.frame.size.height - keyboardFrame.size.height
    let textFieldY = currentFirstResponder.frame.origin.y
    
    let diff = textFieldY - keyBoardY
    
    if diff >= 0 {
      offset.y = offset.y + diff + currentFirstResponder.bounds.size.height
    }
    scrollView.contentOffset = offset
  }

  func keyBoardWillHide(notification: Notification) {
    
      scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)
  }
  
  func extractParamsForActivityAndRecord() {
    
    var tags: [String] = []
    if let text = hashTagsField.text {
      tags = extractHashTagsFromText(text: text)
    }
    
    if let text = titleTextField.text {
      recordActivityWithTitle(title: text, hashTags: tags)
    }
    
  }

  private func presentAlertAndClearForm() {
    
    let alert = UIAlertController(title: "LOCATION TAGGED!!", message: "Your current location has been tagged in search.", preferredStyle: .alert)
    alert.addAction(.init(title: "OK", style: .default, handler: nil))
    
    present(alert, animated: true, completion: nil)
    
    titleTextField.text = ""
    hashTagsField.text = ""
    hashTagsField.resignFirstResponder()
    titleTextField.resignFirstResponder()

  }
  
  
  private func extractHashTagsFromText(text: String ) -> [String] {
    
    var hashTags: [String] = []
    
    do {
      let regex = try NSRegularExpression(pattern: "#(\\w+)", options: .caseInsensitive)
      defer {
        let matches = regex.matches(in: text, options: .init(rawValue: 0), range: NSMakeRange(0, text.characters.count))
        
        hashTags = matches.map({ (match) -> String in
          
          let textNSString = text as NSString
          var hashString = textNSString.substring(with: match.range) as NSString
          return hashString.substring(with: NSMakeRange(1, hashString.length - 1)) as String
          
        })
      }
    }
    catch {
      
    }
    
    return hashTags
  }
  
  private func recordActivityWithTitle(title: String, hashTags: [String]) {
    
    guard let location = mapView.userLocation.location else {
      
      return
      
    }
    let activity = NSUserActivity(activityType: "com.proactive.mapview" + UUID().uuidString)
    activity.isEligibleForSearch = true
    activity.isEligibleForHandoff = true
    activity.isEligibleForPublicIndexing = true
    activity.title = title
    activity.userInfo = ["tags" : hashTags , "latitude" : NSNumber(value: location.coordinate.latitude),
                          "longitude" : NSNumber(value: location.coordinate.longitude)]
    
    let attributes = CSSearchableItemAttributeSet(itemContentType: "location")
    
    let url = Bundle.main.url(forResource: "ball", withExtension: "png")
    attributes.thumbnailURL = url
    attributes.supportsNavigation = true
    attributes.namedLocation = title
    attributes.latitude = NSNumber(value: location.coordinate.latitude)
    attributes.longitude = NSNumber(value: location.coordinate.longitude)
    attributes.keywords = hashTags
    activity.contentAttributeSet = attributes
    activity.needsSave = true
    self.activity = activity
    self.activity?.becomeCurrent()

    presentAlertAndClearForm()
  }
  
  
  private func setUpLocationManager() {
    
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    
    mapView.showsUserLocation = true
    
    if CLLocationManager.locationServicesEnabled() {
      locationManager.startUpdatingLocation()
    }
  }
  
}


extension TagLocationVC: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    
    
  }
}

extension TagLocationVC: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    let userLocation = locations[0]
    let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
    let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

    mapView.setRegion(region, animated: true)
    
    // Drop a pin at user's Current Location
    let myAnnotation: MKPointAnnotation = MKPointAnnotation()
    myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
    myAnnotation.title = "Current location"
    mapView.removeAnnotations(mapView.annotations)
    mapView.addAnnotation(myAnnotation)
    
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
    if status == .authorizedWhenInUse || status == .authorizedAlways {
      
      let annotation = MKPointAnnotation()
      annotation.coordinate = CLLocationCoordinate2D(latitude: mapView.userLocation.coordinate.latitude, longitude: mapView.userLocation.coordinate.longitude)
      mapView.addAnnotation(annotation)

    }
  }
}

extension TagLocationVC: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    switch textField {
    case titleTextField:
        hashTagsField.becomeFirstResponder()
    case hashTagsField:
        hashTagsField.resignFirstResponder()
        currentFirstResponder = nil
        extractParamsForActivityAndRecord()
    default:
      break
    }
    return true
  }
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    
    currentFirstResponder = textField
    
    return true
  }
  
 }

