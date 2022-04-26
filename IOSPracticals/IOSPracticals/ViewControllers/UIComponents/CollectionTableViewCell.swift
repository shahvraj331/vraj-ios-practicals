import UIKit

class CollectionTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var stpUpdateCollectionView: UIStepper!
    @IBOutlet weak var pvNoOfAlterations: UIPickerView!
    
    //MARK: - Variables
    let numberOfAlterations = ["1", "2", "3", "5", "10"]
    var currentNumberOfAlterations = 1
    var numberOfItems = 0
    var previousStpValue = 0
    
    //MARK: - UIViewController
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpDelegate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Actions
    @IBAction func stpValueChanged(_ sender: UIStepper) {
        if Int(sender.value) > previousStpValue {
            numberOfItems += currentNumberOfAlterations
            numberOfItems = numberOfItems > 100 ? 100 : numberOfItems
        } else {
            numberOfItems -= currentNumberOfAlterations
            numberOfItems = numberOfItems < 0 ? 0 : numberOfItems
        }
        previousStpValue = numberOfItems
        stpUpdateCollectionView.value = Double(numberOfItems)
        collectionView.reloadData()
    }
    
    //MARK: - File private functions
    fileprivate func setUpDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
        pvNoOfAlterations.dataSource = self
        pvNoOfAlterations.delegate = self
    }
    
}//End of class

//MARK: - UICollectionViewDataSource
extension CollectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentCell", for: indexPath) as UICollectionViewCell
        return cell
    }
    
}//end of extension

//MARK: - UICollectionViewDelegateFlowLayout
extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}//end of extension

//MARK: - UIPickerViewDelegate
extension CollectionTableViewCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberOfAlterations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentNumberOfAlterations = Int(numberOfAlterations[row]) ?? 1
    }
    
}//End of extension

//MARK: - UIPickerViewDataSource
extension CollectionTableViewCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberOfAlterations.count
    }
    
}//End of extension
