abstract class SpaceEvent {}

class FetchSpaceByUserEvent extends SpaceEvent{
  final String userId;

  FetchSpaceByUserEvent(this.userId);

}

class FetchSingleSpaceEvent extends SpaceEvent {
  final int spaceId;

  FetchSingleSpaceEvent(this.spaceId);
}

