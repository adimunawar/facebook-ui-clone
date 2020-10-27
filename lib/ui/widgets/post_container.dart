part of 'widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(
                  height: 4,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6.0,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl))
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  _PostHeader({this.post});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.user.name,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  '${post.timeAgo}• ',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12.0,
                )
              ],
            ),
          ],
        )),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () => print("more"))
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                padding: EdgeInsets.all(4),
                decoration:
                    BoxDecoration(color: facebookBlue, shape: BoxShape.circle),
                child: Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                )),
            SizedBox(width: 4.0),
            Expanded(
                child: Text(
              '${post.likes}',
              style: TextStyle(color: Colors.grey),
            )),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            _PushButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            _PushButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            _PushButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            ),
          ],
        )
      ],
    );
  }
}

class _PushButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  _PushButton({this.icon, this.label, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(width: 4),
                  Text(label, style: TextStyle(color: Colors.grey[600]))
                ],
              ),
            ),
          )),
    );
  }
}
