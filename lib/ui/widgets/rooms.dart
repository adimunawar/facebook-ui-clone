part of 'widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms({this.onlineUsers});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreatRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true),
            );
          }),
    );
  }
}

class _CreatRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print("Creat Room"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(width: 3, color: Colors.blueAccent[100]),
      textColor: facebookBlue,
      child: Row(
        children: [
          Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.purple,
          ),
          SizedBox(
            width: 4.0,
          ),
          Text('Create\n Room')
        ],
      ),
    );
  }
}
