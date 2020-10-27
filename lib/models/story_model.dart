part of 'models.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  Story({@required this.imageUrl, @required this.user, this.isViewed = false});
}
