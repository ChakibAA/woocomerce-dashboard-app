// ignore_for_file: file_names
class Filter {
  String text;
  String value;
  String sortOrder;
  Filter(this.text, this.value, this.sortOrder);
}

final sortByOptions = [
  Filter("Tout", '', "asc"),
  Filter("En attente de paimenet", "pending", "asc"),
  Filter("En traitement", "processing", "asc"),
  Filter("En attente", "on-hold", "asc"),
  Filter("Terminer", "completed", "asc"),
  Filter("Annuler", "cancelled", "asc"),
  Filter("Échoué", "failed", "asc"),
];

final Map<String, String> tradStatus = {
  'pending': 'En attente de paimenet',
  'processing': 'En traitement',
  'on-hold': 'En attente',
  'completed': 'Terminer',
  'cancelled': 'Annuler',
  'failed': 'Échoué',
};
