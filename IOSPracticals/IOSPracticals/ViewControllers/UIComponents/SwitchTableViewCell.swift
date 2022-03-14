import UIKit

class SwitchTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var swChangeOrientation: UISwitch!
    @IBOutlet weak var svButtonStack: UIStackView!
    
    //MARK: - UIViewController
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Actions
    @IBAction func onSwitchValueChanged(_ sender: UISwitch) {
        svButtonStack.axis = sender.isOn ? .vertical : .horizontal
    }
    
}//End of class
