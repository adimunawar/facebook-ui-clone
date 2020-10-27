part of 'widgets.dart';

class Stroies extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stroies({this.currentUser, this.stories});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1 + stories.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child:
                        _StoryCard(isAddStory: true, currentUser: currentUser));
              }
              final Story story = stories[index - 1];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  story: story,
                ),
              );
            }));
  }
}

class _StoryCard extends StatelessWidget {
  final Story story;
  final bool isAddStory;
  final User currentUser;

  _StoryCard({
    this.story,
    this.isAddStory = false,
    this.currentUser,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
              imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            gradient: storyGradient,
            borderRadius: BorderRadius.circular(12.0),
            // boxShadow:
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: isAddStory
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 30.0,
                      color: facebookBlue,
                      onPressed: () {},
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl, hasBorder: !story.isViewed))
      ],
    );
  }
}
