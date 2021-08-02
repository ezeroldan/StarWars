import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PeopleView()) {
                    Boton(icon: PeopleView.icon, title: PeopleView.title)
                }
                NavigationLink(destination: FilmsView()) {
                    Boton(icon: FilmsView.icon, title: FilmsView.title)
                }
                NavigationLink(destination: PlanetsView()) {
                    Boton(icon: PlanetsView.icon, title: PlanetsView.title)
                }
                NavigationLink(destination: SpeciesView()) {
                    Boton(icon: SpeciesView.icon, title: SpeciesView.title)
                }
                NavigationLink(destination: StarshipsView()) {
                    Boton(icon: StarshipsView.icon, title: StarshipsView.title)
                }
                NavigationLink(destination: VehiclesView()) {
                    Boton(icon: VehiclesView.icon, title: VehiclesView.title)
                }
            }.navigationBarTitle("Star Wars Api")
        }
    }
}

struct Boton: View {
    var icon: String
    var title: String
    var body: some View {
        HStack {
            Image(systemName: self.icon)
                .scaledToFit()
                .frame(width: 30, height: 20)
                .foregroundColor(.gray)
            Text(self.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
