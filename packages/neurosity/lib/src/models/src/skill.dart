///
typedef SkillProps = Map<String, dynamic>;

///
typedef Manifestprops = Map<String, dynamic>;

///
typedef SkillMetric = Map<String, dynamic>;

///
class Skill {
  ///
  const Skill({
    required this.id,
    required this.bundleId,
    required this.spec,
    required this.name,
    required this.description,
    this.props,
    this.organization,
    required this.metrics,
    required this.userId,
    required this.timestamp,
    required this.status,
    required this.thumbnail,
  });

  ///
  final String id;

  ///
  final String bundleId;

  ///
  final String spec;

  ///
  final String name;

  ///
  final String description;

  ///
  final SkillProps? props;

  ///
  final String? organization;

  ///
  final List<String> metrics;

  ///
  final String userId;

  ///
  final int timestamp;

  ///
  final String status;

  ///
  final String thumbnail;
}

///
class DeviceSkill {
  ///
  const DeviceSkill({
    required this.id,
    required this.bundleId,
    required this.installedDate,
    required this.manifest,
    required this.status,
  });

  ///
  final String id;

  ///
  final String bundleId;

  ///
  final int installedDate;

  ///
  final Manifestprops manifest;

  ///
  final String status;
}
