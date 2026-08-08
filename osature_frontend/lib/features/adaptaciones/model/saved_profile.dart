// Un perfil de adaptaciones que el usuario tiene guardado.
class SavedProfile {
  const SavedProfile({required this.id, required this.nombre});

  final String id;
  final String nombre;
}

/// Perfiles guardados.
const List<SavedProfile> savedProfiles = [
  SavedProfile(id: 'P1', nombre: 'Perfil 1'),
  SavedProfile(id: 'P2', nombre: 'Perfil 2'),
];
