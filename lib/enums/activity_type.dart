enum ActivityType {
  none,
  workoutRegime,
  reminder,
}

extension ActivityTypeValues on ActivityType {
  String toValue() {
    switch (this) {
      case ActivityType.workoutRegime:
        return 'Workout Regime';
      case ActivityType.reminder:
        return 'Reminder';
      default:
        return '';
    }
  }
}

extension StringToActivityType on String {
  ActivityType toActivityTypeEnum() {
    if (this == ActivityType.workoutRegime.toValue()) {
      return ActivityType.workoutRegime;
    }
    if (this == ActivityType.reminder.toValue()) {
      return ActivityType.reminder;
    }
    
    return ActivityType.none;
  }
}