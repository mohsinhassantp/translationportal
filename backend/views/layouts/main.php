<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => 'Translation Portal',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    /*$menuItems = [
        ['label' => 'Home', 'url' => ['/site/index']],
    ];*/
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
    } else {

        $languageId  = \Yii::$app->session->get('languageId');

        if(empty($languageId)){

            $languageId = \backend\models\User::findOne(['id'=>  Yii::$app->user->id]);
            $languageName = \backend\models\Language::findOne(['language_id'=>  $languageId['language_id']]);
            \Yii::$app->session->set('languageId',$languageId['language_id']);
            \Yii::$app->session->set('role',$languageId['role']);
            \Yii::$app->session->set('language',$languageName['language_name']);
        }


        //if(\Yii::$app->session->get('role') == Yii::$app->params['SuperAdminRoleID'])
        if(\Yii::$app->user->identity->isAdmin)
        {  $menuItems[] = ['label' => 'Admins', 'url' => ['/user/admin/index']];
            /*$menuItems[] = ['label' => 'Admins', 'items' =>
                ['label' => 'List', 'url' => '/user/admin/index'],
                ['label' => 'Create New', 'url' => '/user/admin/create']
            ];*/
            $menuItems[] = ['label' => 'Languages', 'url' => ['/language/index']];
            $menuItems[] = ['label' => 'Windows', 'url' => ['/screen-window/index']];
            $menuItems[] = ['label' => 'Images', 'url' => ['/screenshot/index']];
            $menuItems[] = ['label' => 'Labels', 'url' => ['/system-label/index']];
            $menuItems[] = ['label' => 'Translation', 'url' => ['/translation/index']];
            $menuItems[] = ['label' => 'Windows & Labels', 'url' => ['/screen-window/window-label']];
            $menuItems[] = ['label' => 'Types', 'url' => ['/types/index']];
            $menuItems[] = ['label' => 'Help', 'items' => ['label', 'User Guide' ,'url' => '/types/index']];
            $languageStr = '';
        }
        else{
            $languageStr = ' - '.\Yii::$app->session->get("language");
            $menuItems[] = ['label' => 'Windows & Labels', 'url' => ['/screen-window/window-label']];
            /*$menuItems[] = ['label' => 'Labels', 'url' => ['/system-label/index']];*/
            $menuItems[] = ['label' => 'Translation', 'url' => ['/translation/index']];
        }


        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                'Logout (' . Yii::$app->user->identity->username . $languageStr .')',
                ['class' => 'btn btn-link logout']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; Flexiroam Sdn Bhd. <?= date('Y') ?></p>

        <!--<p class="pull-right"><?/*= Yii::powered() */?></p>-->
        <p class="pull-right"><?= "Version 1.0" ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

<div class="col-sm-12 prog-bar">
    <div class="modal fade" id="modal-img" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <img src="" class="preview">
                </div>
            </div>
        </div>
    </div>
</div>
