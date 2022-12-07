import UIKit


class ArtistViewController: UIViewController {
    
    private var gateway = ArtistsGateway()
    private var items = [EntityProtocol]()
    
    var artist: Artist?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var entitySegment: UISegmentedControl!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        if let artist = self.artist {
            Task { [weak self] in
                await self?.gateway.fetchArtistTracks(artist.id, { [weak self] tracks in
                    Task {
                        self?.items = tracks
                        self?.tableView.reloadData()
                    }
                })
            }
            self.title = artist.name
        }
        self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "PlayerCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        if let artist = self.artist {
            Task { [weak self] in
                await self?.gateway.fetchArtistTracks(artist.id, { [weak self] tracks in
                    Task {
                        self?.items = tracks
                        self?.tableView.reloadData()
                    }
                })
            }
            self.title = artist.name
        }
        self.addButton.isHidden = UsersGateway.shared.user?.Permission ?? 0 < 2
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        if let artist = self.artist {
            Task { [weak self] in
                switch sender.selectedSegmentIndex{
                case 0:
                    await self?.gateway.fetchArtistTracks(artist.id, { [weak self] tracks in
                        Task {
                            self?.items = tracks
                            self?.tableView.reloadData()
                        }
                    })
                default:
                    await self?.gateway.fetchArtistAlbums(artist.id, { [weak self] albums in
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

extension ArtistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        let config = self.items[indexPath.row].cellConfiguration()
        let image: GatewayProtocol = self.entitySegment.selectedSegmentIndex == 0 ? TracksGateway() : AlbumsGateway()
        cell.setup(config.title, config.details, image.associatedImage())
        return cell
    }
    
    
}

extension ArtistViewController: UITableViewDelegate {
    
}
