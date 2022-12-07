import UIKit


class GenreViewController: UIViewController {
    
    var genre: Genre?
    private var items = [EntityProtocol]()
    private var gateway = GenresGateway()

    @IBOutlet weak var entitySegment: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        if let genre = self.genre {
            self.title = genre.title
            self.didChangeEntity(self.entitySegment)
        }
        self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        if let genre = self.genre {
            self.title = genre.title
            self.didChangeEntity(self.entitySegment)
        }
        self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
    }
    
    @IBAction func didChangeEntity(_ sender: UISegmentedControl) {
        if let genre = self.genre {
            Task { [weak self] in
                switch sender.selectedSegmentIndex{
                case 0:
                    await self?.gateway.fetchTracksForGenre(genre.id, { [weak self] tracks in
                        Task {
                            self?.items = tracks
                            self?.tableView.reloadData()
                        }
                    })
                case 1:
                    await self?.gateway.fetchArtistsForGenre(genre.id, { [weak self] artists in
                        Task {
                            self?.items = artists
                            self?.tableView.reloadData()
                        }
                    })
                default:
                    await self?.gateway.fetchAlbumsForGenre(genre.id, { [weak self] albums in
                        Task {
                            self?.items = albums
                            self?.tableView.reloadData()
                        }
                    })
                }
            }
        }
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension GenreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let config = self.items[indexPath.row].cellConfiguration()
        var image: GatewayProtocol = self.entitySegment.selectedSegmentIndex == 0 ? TracksGateway() : ArtistsGateway()
        image = self.entitySegment.selectedSegmentIndex == 1 ? ArtistsGateway() : AlbumsGateway()
        cell.setup(config.title, config.details, image.associatedImage())
        return cell
    }
    
    
}

extension GenreViewController: UITableViewDelegate {
    
}
