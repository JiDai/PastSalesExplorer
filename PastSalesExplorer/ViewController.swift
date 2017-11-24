//
//  ViewController.swift
//  PastSalesExplorer
//
//  Created by Jordi Dosne on 26/11/2017.
//  Copyright © 2017 Jordi Dosne. All rights reserved.
//

import Mapbox

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let urlStyle = URL(string: "mapbox://styles/meilleursagents/cj1eyu17c00iv2rqslqi866y6")
        let mapView = MGLMapView(frame: self.view.bounds, styleURL: urlStyle)
        mapView.setCenter(CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), zoomLevel: 14, animated: false)
        self.view.addSubview(mapView)

        
        let urlJSON = URL(string: "https://jordid-www.meilleursagents.tech/carte/biens-vendus?bounds=48.84492767800512,2.3329039999961196,48.86884843286438,2.370113999988064")!
        let geoJSONSource = MGLShapeSource(identifier: "earthquakes", url: urlJSON, options: [.clustered: true, .clusterRadius: 20, .maximumZoomLevelForClustering: 15])
        mapView.style?.addSource(geoJSONSource)
        
        let layer = MGLSymbolStyleLayer(identifier: "coffeeshops", source: geoJSONSource)
        layer.sourceLayerIdentifier = "earthquakes"
        layer.iconImageName = MGLStyleValue(rawValue: "blue")
        mapView.style?.addLayer(layer)


    }
}
