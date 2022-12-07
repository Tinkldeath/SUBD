import UIKit


class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var associatedImage: UIImageView!
    
    func setup(_ title: String, _ details: String, _ image: UIImage) {
        self.title.text = title
        self.details.text = details
        self.associatedImage.image = image
    }
    
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var entitySegment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var gateways: [Int: GatewayProtocol] = [
        0: TracksGateway(),
        1: ArtistsGateway(),
        2: AlbumsGateway(),
        4: GenresGateway()
    ]
    
    private var current: GatewayProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.current = self.gateways[self.entitySegment.selectedSegmentIndex]
        Task { [weak self] in
            await self?.current.fetch()
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.current.entities.bind { [weak self] _ in
            Task {
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func selectionDidChange(_ sender: Any) {
        guard let current = self.gateways[self.entitySegment.selectedSegmentIndex] else { return }
        self.current = current
        Task { [weak self] in
            await self?.current.fetch()
            self?.current.entities.bind({ _ in
                Task {
                    self?.tableView.reloadData()
                }
            })
        }
    }
    

}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.current.entities.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let config = self.current.entities.value[indexPath.row].cellConfiguration()
        cell.setup(config.title, config.details, self.current.associatedImage())
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    
}
