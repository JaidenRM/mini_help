enum ActivityType {
  none,
  workout,
  reminder,
}

extension ActivityTypeValues on ActivityType {
  String toValue() {
    switch (this) {
      case ActivityType.workout:
        return 'Workout';
      case ActivityType.reminder:
        return 'Reminder';
      default:
        return '';
    }
  }
}

extension StringToActivityType on String {
  ActivityType toActivityTypeEnum() {
    if (this == ActivityType.workout.toValue()) {
      return ActivityType.workout;
    }
    if (this == ActivityType.reminder.toValue()) {
      return ActivityType.reminder;
    }
    
    return ActivityType.none;
  }
}