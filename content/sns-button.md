+++
date = "2017-11-28T12:38:33+09:00"
draft = true
title = "sns button"

+++

# twitter

https://publish.twitter.com/  
でHTMLを用意できる  

下のカード表示のリンクに、share用があるのでそこから作成  

```
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
```

# facebook

## like

https://developers.facebook.com/docs/plugins/like-button  

## share

https://developers.facebook.com/docs/plugins/share-button  
でHTMLを用意できる  
Facebook Appごとに作られるため、あらかじめAppを用意しておく  

insert before </body>  

```
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.11&appId=xxxxxxxxxxxxxxx';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script><Paste>
```

paste where you want to show  

```
<div class="fb-share-button" data-href="https://sample.com/" data-layout="button_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fsample.com%2F&amp;src=sdkpreparse">Share</a></div>
```

# google plus

https://developers.google.com/+/web/+1button/  

sample  

```
<html>
<head>
<title>+1 demo: Basic page</title>
<link rel="canonical" href="http://www.example.com" />
<script src="https://apis.google.com/js/platform.js" async defer>
</script>
</head>
<body>
<g:plusone></g:plusone>
</body>
</html>
```

# hatena

http://b.hatena.ne.jp/guide/bbutton  

sample  

```
<a href="http://b.hatena.ne.jp/entry/" class="hatena-bookmark-button" data-hatena-bookmark-layout="basic-label-counter" data-hatena-bookmark-lang="ja" title="このエントリーをはてなブックマークに追加"><img src="https://b.st-hatena.com/images/entry-button/button-only@2x.png" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" /></a><script type="text/javascript" src="https://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script>
```

# pocket

https://getpocket.com/publisher/button  

```
<a data-pocket-label="pocket" data-pocket-count="horizontal" class="pocket-btn" data-lang="en"></a>
<script type="text/javascript">!function(d,i){if(!d.getElementById(i)){var j=d.createElement("script");j.id=i;j.src="https://widgets.getpocket.com/v1/j/btn.js?v=1";var w=d.getElementById(i);d.body.appendChild(j);}}(document,"pocket-btn-js");</script>
```
