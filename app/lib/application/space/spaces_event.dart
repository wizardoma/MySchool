abstract class SpaceEvent {

}

class FetchSpaceByUserEvent extends SpaceEvent{
  final String userId;

  FetchSpaceByUserEvent(this.userId);

}

