
import UIKit

class MessageListVC: UIViewController {
    
    @IBOutlet weak var messageTableV: UITableView! {
        didSet {
            messageTableV.delegate = self
            messageTableV.dataSource = self
            messageTableV.register(cellType: MessageCell.self)        }
    }
}

extension MessageListVC: UITableViewDelegate {
    
}

extension MessageListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MessageCell.self, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 選択不可にする
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MessageVC") as! MessageVC
        present( nextVC, animated: true )
    }
    
    
}
