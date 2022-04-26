import UIKit
import MapKit

class MapViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var pvCities: UIPickerView!
    @IBOutlet weak var currentMapView: MKMapView!
    @IBOutlet weak var scMapType: UISegmentedControl!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnBack: UIImageView!
    
    //MARK: - Variables
    let annotations = MKPointAnnotation()
    let citiesList = ["Select a city", "Nadiad", "Ahmedabad", "Anand", "Vadodara", "Surat"]
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackFunctionality()
        pvCities.delegate = self
        pvCities.dataSource = self
    }
    
    //MARK: - Actions
    @IBAction func onMapTypeChanged(_ sender: UISegmentedControl) {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            switch self.scMapType.selectedSegmentIndex {
            case 0: self.currentMapView.mapType = .standard
            case 1: self.currentMapView.mapType = .hybrid
            case 2: self.currentMapView.mapType = .satellite
            default: break
            }
            self.activityIndicator.stopAnimating()
        }
    }
    
    //MARK: - File private functions
    fileprivate func updateMap(_ cityIndex: Int, _ latitude: Double, _ longitude: Double) {
        var region: MKCoordinateRegion
        currentMapView.removeAnnotation(annotations)
        if cityIndex != 0 {
            annotations.title = citiesList[cityIndex]
            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            currentMapView.addAnnotation(annotations)
            region = MKCoordinateRegion(center: annotations.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
        } else {
            region = MKCoordinateRegion(.world)
        }
        UIView.animate(withDuration: 3.0) {
            self.currentMapView.setRegion(region, animated: true)
        }
    }
    
    fileprivate func addBackFunctionality() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goBackToHome))
        btnBack.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func goBackToHome() {
        dismiss(animated: true, completion: nil)
    }
    
}//End of class

//MARK: - UIPickerViewDelegate
extension MapViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 1: updateMap(row, 22.691867829875306, 72.863169579625)
        case 2: updateMap(row, 23.02446213260744, 72.569708091261)
        case 3: updateMap(row, 22.565197092670637, 72.92842572244159)
        case 4: updateMap(row, 22.30947175804538, 73.179899499692)
        case 5: updateMap(row, 21.17077770371674, 72.83135937728582)
        default: updateMap(0, 0.00, 0.00)
        }
    }
    
}//End of extension

//MARK: - UIPickerViewDataSource
extension MapViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesList.count
    }
    
}//End of extension
