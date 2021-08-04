import SwiftUI

struct PeopleView: View {
    @State private var page: Int = 1
    @State private var total: Int = 0
    @State private var lastId: Int = 0
    @State private var results: [Person] = []

    public static let icon: String = "person.fill"
    public static let title: String = "People"

    var body: some View {
        List(self.results) { (person: Person) in
            NavigationLink(destination: PersonView(id: person.id)) {
                HStack {
                    Image(systemName: PeopleView.icon)
                        .scaledToFit()
                        .frame(width: 30, height: 20)
                        .foregroundColor(.gray)
                    Text(person.name)
                }
            }.onAppear {
                if self.lastId == person.id, self.total > self.results.count {
                    self.loadData()
                }
            }
        }
        .navigationBarTitle(PeopleView.title)
        .navigationBarItems(trailing: Text("Total: \(self.total)"))
        .onAppear(perform: self.loadData)
    }

    private func loadData() {
        if results.count == 0 || total > results.count {
            Api.getPeople(page: page) { (results: PeopleResults) in
                self.total = results.count
                self.page = results.nextPage
                for person in results.results {
                    self.results.append(person)
                    self.lastId = person.id
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
