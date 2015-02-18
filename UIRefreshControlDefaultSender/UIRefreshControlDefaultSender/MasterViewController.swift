import UIKit

class MasterViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "reload:", forControlEvents: .ValueChanged)
    }

    @objc func reload(sender: UIRefreshControl? = nil) {
        println("Refreshed!")
        sender?.endRefreshing()
    }
}
