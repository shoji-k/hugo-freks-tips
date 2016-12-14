+++
title = "symfony"
draft = false
date = "2016-12-14T11:25:54+09:00"
categories = [ "engineer" ]
tags = [ "php", "symfony" ]

+++

### starter

see [Installing & Setting up the Symfony Framework \(2\.8\)](http://symfony.com/doc/2.8/setup.html)

Symfonyのデモ付き一式ディストリビューションインストール  
$ composer create-project symfony/framework-standard-edition my_project_name "2.8.*"

環境チェック  
$ php app/check.php
or  
access http://localhost:8000/config.php  

使えるservicesを確認  
php app/console debug:container  

起動  
$ php app/console server:run

コントローラーをつくってhtmlを返す  
ルーティングはアノテーションで設定できる  
phpのファイルはsrc以下に保存  
$ vim src/AppBundle/Controller/LuckyController.php  

```
namespace AppBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Response;

class LuckyController
{
    /**
     * @Route("/hey/yo")
     */
    public function hoo()
    {
        return new Response(
            '<html><body>hey</body></html>'
        );
    }
}
```

Twigテンプレートを返す  
phpでない設定ファイルやテンプレートはapp以下に保存  
$ vim src/AppBundle/Controller/LuckyController.php  

```
namespace AppBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class LuckyController extends Controller
{
    /**
     * @Route("/lucky/number")
     */
    public function numberAction()
    {
        $number = mt_rand(0, 100);

        return $this->render('lucky/number.html.twig', array(
            'number' => $number,
        ));
    }
}
```

$ vim app/Resources/views/lucky/number.html.twig  

```
<h1>Your lucky number is {{ number }}</h1>
```

