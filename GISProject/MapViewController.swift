//
//  BattleScreenViewController.swift
//  GISProject
//
//  Created by Muhd Mirza on 12/5/16.
//  Copyright © 2016 NYP. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, LocationsProtocol {
	
	@IBOutlet var cancelButton: UIBarButtonItem!
	@IBOutlet var map: MKMapView!
	
	var locationManager: CLLocationManager?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.locationManager = CLLocationManager()
		self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
		self.locationManager?.requestWhenInUseAuthorization()
		self.locationManager?.startUpdatingLocation()
		
		self.map.showsUserLocation = true
		self.map.mapType = .Standard
		self.map.zoomEnabled = true
		self.map.scrollEnabled = true
		
		let location = Location()
		location.delegate = self
		location.downloadItems()
		
//		for i in 0 ..< 10 {
//			var location = CLLocationCoordinate2D()
//			
//			// 1.383884, 103.843563
//			// 1.376527, 103.850891
//			
//			// latitude 1.376527 -- 1.383884
//			// longitude 103.843563 -- 103.850891
//			
//			var random = Double(arc4random()) % 0.007357
//			let latitudeRange = 1.376527 + random
//			
//			random = Double(arc4random()) % 0.007328
//			let longitudeRange = 103.843563 + random
//			
//			location.latitude = latitudeRange
//			location.longitude = longitudeRange
//			
//			let userAnnotation = MapAnnotation.init(coordinate: location, title: "User location", subtitle: "Hello")
//			userAnnotation
//			self.map.addAnnotation(userAnnotation)
//			
//			locationArr.addObject(userAnnotation)
//			
//			print("\(location.latitude)")
//			print("\(location.longitude)")
//		}
		
	}
	
	func itemsDownloaded(items: NSArray) {
		for i in 0 ..< items.count {
			let locationModel = items[i] as? LocationModel
			self.map.addAnnotation(locationModel!)
		}
		
		var span = MKCoordinateSpan()
		span.latitudeDelta = 0.02
		span.longitudeDelta = 0.02
		
		var locationTest = CLLocationCoordinate2D()
		locationTest.latitude = (1.376527 + 1.383884) / 2
		locationTest.longitude = (103.843563 + 103.850891) / 2
		
		var region = MKCoordinateRegion()
		region.center = locationTest
		region.span = span
		
		self.map.setRegion(region, animated: true)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

}
