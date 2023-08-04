// ignore_for_file: file_names
class Filter {
  String text;
  String value;
  String sortOrder;
  Filter(this.text, this.value, this.sortOrder);
}

final sortByOptions = [
  Filter("En attente", "pending", "asc"),
  Filter("Valider", "validated", "asc"),
  Filter("En livraison", "shipping", "asc"),
  Filter("Livré", "completed", "asc"),
  Filter("Retour", "returned", "asc"),
  Filter("Annuler", "refused", "asc"),
];

final Map<String, String> tradStatus = {
  'pending': 'En attente',
  'validated': 'Valider',
  'shipping': 'En livraison',
  'completed': 'Livré',
  'returned': 'Retour',
  'refused': 'Annuler',
};
