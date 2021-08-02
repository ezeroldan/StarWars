import SwiftUI

struct StarshipsView: View {
    public static let icon: String = "airplane"
    public static let title: String = "Starships"

    var body: some View {
        Text("Starships")
    }
}

struct StarshipsView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipsView()
    }
}
