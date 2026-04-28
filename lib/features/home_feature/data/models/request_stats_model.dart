class RequestStatsModel {
  final int newCount;
  final int progressCount;
  final int completedCount;
  final int rejectedCount;

  RequestStatsModel({
    required this.newCount,
    required this.progressCount,
    required this.completedCount,
    required this.rejectedCount,
  });

  factory RequestStatsModel.fromJson(Map<String, dynamic> json) {
    return RequestStatsModel(
      newCount: json['new'],
      progressCount: json['progress'],
      completedCount: json['completed'],
      rejectedCount: json['rejected'],
    );
  }
}
