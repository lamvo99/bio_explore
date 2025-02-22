// Project imports:

import 'package:bio_explore/services/models/meta/meta.dart';

extension MetaExt on Meta? {
  bool get canNextPage => this == null
      ? false
      : ((this!.nextPage > this!.currentPage) &&
          (this!.totalPages > this!.currentPage));
}
