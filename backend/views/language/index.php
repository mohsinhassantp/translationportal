<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\SearchLanguage */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Languages');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="language-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Language'), ['create'], ['class' => 'btn btn-success']) ?>
        <?php //= Html::a(Yii::t('app', 'Generate IOS Translations File'), ['system-label/generate-translate-ios'], ['class' => 'btn btn-danger']) ?>
        <?php //= Html::a(Yii::t('app', 'Generate Android Translations File'), ['system-label/generate-translate-android'], ['class' => 'btn btn-primary']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'language_id',
            'language_name',
            'created_at',

            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{import-ios} {import-android}',
                'buttons' => [
                    'import-ios' => function ($url) {
                        return Html::a(
                            '<span class="btn btn-primary" style="padding-left:5px;">Generate IOS</span>',
                            $url,
                            [
                                'title' => 'Generate IOS',
                                'data-pjax' => '0',
                            ]
                        );
                    },
                    'import-android' => function ($url) {
                        return Html::a(
                            '<span class="btn btn-success" style="padding-left:5px;">Generate Android</span>',
                            $url,
                            [
                                'title' => 'Generate Android',
                                'data-pjax' => '0',
                            ]
                        );
                    },
                ],
            ],
            ['class' => 'yii\grid\ActionColumn'],
        ],

    ]); ?>
<?php Pjax::end(); ?></div>
