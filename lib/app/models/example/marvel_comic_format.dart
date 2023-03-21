import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum MarvelComicFormat {
  @JsonValue('Comic')
  comic,
  @JsonValue('Magazine')
  magazine,
  @JsonValue('Trade Paperback')
  tradePaperback,
  @JsonValue('Hardcover')
  hardCover,
  @JsonValue('Digest')
  digest,
  @JsonValue('Graphic Novel')
  graphicNovel,
  @JsonValue('Digital Comic')
  digitalComic,
  @JsonValue('Infinite Comic')
  infiniteComic,
}
