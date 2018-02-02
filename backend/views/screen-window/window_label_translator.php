<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
//use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use backend\models\Types;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\SearchScreenWindow */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Screen Windows');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="screen-window-index">

    <!--<h1><?/*= Html::encode($this->title) */?></h1>-->
    <h1><?= Html::encode("Windows & Labels") ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>

    </p>
    <?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            /*'window_id',*/
            'window_name',
            [
                'attribute' => 'labels',
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
                'format' => 'html',
                'value' => function ($model) {
                    $str = "";
                    foreach ($model->label as $lab) {
                        //$translation = \backend\models\Translation::find()->where(['label_id'=> $lab->label_id , "is_approved" => 1 , "language_id" => 4])->one();
                        //var_dump($translation);
                        $str .= "- <a href='../system-label/view?id=" . $lab->label_id . "'>" . $lab->label . "</a><br />";
                    }
                    return $str;
                }
            ],
            [
                'attribute' => 'Status',
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
                'format' => 'html',
                'value' => function ($model) {
                    $str = '<span class="btn btn-success" style="padding-left:5px;">COMPLETE</span>';
                    foreach ($model->label as $lab) {
                        $translation = \backend\models\Translation::find()->where(['label_id'=> $lab->label_id , "is_approved" => 1 , "language_id" => \Yii::$app->session->get('languageId')])->one();
                        if(empty($translation['translation']) && $lab->translatable == 1)
                        {
                            $str = '<span class="btn btn-danger" style="padding-left:5px;">INCOMPLETE </span>';
                        }
                       //echo $translation['translation'];
                    }
                    return $str;
                }
            ],
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "type_id",
                'filter' => ArrayHelper::map(\backend\models\Types::find()->orderBy('type_id')->asArray()->all(), 'type_id', 'type_name'),
                "value" => function($model){
                    if(!empty($model->window_id)){
                        $rel = $model->getTypes($model->window_id)->one();
                        return $rel['type_name'];
                    }
                    else {
                        return "-";
                    }

                },
                "format" => "raw",
            ],
            [
                'attribute' => 'window.screenshot.image',
                'format' => 'html',
                'value' => function($model) {
                    $str = "";
                    foreach($model->screenshot as $screen)
                    {
                        $str .= "<a href=\"javascript:void(0)\" class=\"pop\"><img src='".Yii::getAlias('@image_path').$screen->image."' width='150'></a><br />";
                    }
                    return $str;
                }
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{create-translation-window-label} ',
                'buttons' => [
                    'create-translation-window-label' => function ($url) {
                        return Html::a(
                            '<span class="glyphicon glyphicon-plus-sign" style="padding-left:5px;"></span>',
                            $url,
                            [
                                'title' => 'Add Translation',
                                'data-pjax' => '0',
                            ]
                        );
                    },
                ],
            ],
            /*'created_at',*/


            /*['class' => 'yii\grid\ActionColumn'],*/
        ],
    ]); ?>
    <?php Pjax::end(); ?></div>