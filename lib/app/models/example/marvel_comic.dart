
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'marvel_comic_format.dart';

part 'marvel_comic.freezed.dart';
part 'marvel_comic.g.dart';

@freezed
class MarvelComic with _$MarvelComic {

  @JsonSerializable(explicitToJson: true)
  const factory MarvelComic({
    @JsonKey(name: 'id') required int id,
    int? digitalId,
    String?  title,
    DateTime? modified,
    MarvelComicFormat?  format,
    @Default(<String>[]) List<String> images,
  }) = _MarvelComic;

  factory MarvelComic.fromJson(Map<String,dynamic> json) => _$MarvelComicFromJson(json);



}

