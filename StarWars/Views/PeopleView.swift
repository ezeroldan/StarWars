import SwiftUI

struct PeopleView: View {
    @State private var page: Int = 1
    @State private var total: Int = 0
    @State private var results: [Person] = []

    public static let icon: String = "person.fill"
    public static let title: String = "People"

    var body: some View {
        VStack {
            Text("Total: \(self.total)")

            List(self.results) { (person: Person) in
                NavigationLink(destination: PersonView(id: person.id)) {
                    HStack {
                        Text(String(person.id))
                        Text(person.name)
                    }
                }
            }
        }
        .navigationBarTitle(PeopleView.title)
        .onAppear(perform: self.loadData)
    }

    private func loadData() {
        Api.getPeople(page: page) { (results: PeopleResults) in
            self.total = results.count
            self.page = results.nextPage
            for person in results.results {
                self.results.append(person)
            }

//            while self.page > 0 {
//                self.loadData()
//            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
