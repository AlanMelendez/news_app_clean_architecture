import 'package:equatable/equatable.dart';

import 'source.dart';

class ArticleEntity extends Equatable {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    ArticleEntity({
         this.source,
         this.author,
         this.title,
         this.description,
         this.url,
         this.urlToImage,
         this.publishedAt,
         this.content,
    });


  @override
  List<Object?> get props => [source, author, title, description, url, urlToImage, publishedAt, content];

}