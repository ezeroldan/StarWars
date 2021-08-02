import SwiftUI

struct PersonView: View {
    var id: Int
    @State private var person = Person()

    var body: some View {
        VStack {
            Text(String(self.person.id))
            Text(self.person.name)
            Text(self.person.birthYear)
            Text(self.person.eyeColor)
            Text(self.person.gender)
            Text(self.person.hairColor)
            Text(self.person.height)
            Text(self.person.mass)
            Text(self.person.skinColor)
            // Text(self.person.homeworld)
            // Text(self.person.films)
            // Text(self.person.species)
            // Text(self.person.starships)
            // Text(self.person.vehicles)
        }
        .navigationBarTitle("Person")
        .onAppear {
            Api.getPerson(id: self.id) { (person: Person) in
                self.person = person
            }
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(id: 1)
    }
}
