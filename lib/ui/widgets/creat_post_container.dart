part of 'widgets.dart';

class CreatPostContainer extends StatelessWidget {
  final User currentUser;

  CreatPostContainer({
    Key key,
    this.currentUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(currentUser.imageUrl),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: Container(
                height: 35,
                child: TextField(
                  // maxLines: -1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    hintText: 'What\'s on your mind ?',
                    contentPadding: EdgeInsets.only(left: 15),
                  ),
                ),
              )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 10,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                    onPressed: () => print('live'),
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: Text("Live")),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: () => print('photo Liobrary'),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text("Photo")),
                VerticalDivider(
                  width: 8.0,
                ),
                FlatButton.icon(
                    onPressed: () => print('Rooom'),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purple,
                    ),
                    label: Text("Room")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
