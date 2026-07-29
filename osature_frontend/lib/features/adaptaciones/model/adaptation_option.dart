// Una adaptacion de las que el usuario puede marcar.
class AdaptationOption {
  const AdaptationOption({
    required this.id,
    required this.title,
    required this.description,
  });

  final String id;
  final String title;
  final String description;
}

/// Adaptaciones disponibles.
const List<AdaptationOption> adaptationOptions = [
  AdaptationOption(id: 'A1', title: 'Adaptacion 1', description: ''),
  AdaptationOption(id: 'A2', title: 'Adaptacion 2', description: ''),
  AdaptationOption(id: 'A3', title: 'Adaptacion 3', description: ''),
];
