<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\ArrayHelper;
use backend\models\ScreenWindow;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\SearchSystemLabel */
/* @var $dataProvider yii\data\ActiveDataProvider */

/*$this->registerJs(
    '$(document).ready(function(){
        alert("hi there ");
});', \yii\web\View::POS_END);*/
$this->title = Yii::t('app', 'System Labels');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="system-label-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php //= Html::a(Yii::t('app', 'Create System Label'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'label_id',
            [
                'attribute'=>'label',
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
            ],
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "window_id",
                'contentOptions' => ['style' => 'width:10%; white-space: normal;'],
                'filter' => ArrayHelper::map(ScreenWindow::find()->orderBy('window_name')->asArray()->all(), 'window_id', 'window_name'),
                "value" => function($model){
                    if ($rel = $model->getWindow()->one()) {
                        return yii\helpers\Html::a($rel->window_name,["/screen-window/view/", 'id' =>$rel->window_id],["data-pjax"=>0]);
                    } else {
                        return '-';
                    }
                },
                "format" => "raw",
            ],
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "window.type_id",
                'contentOptions' => ['style' => 'width:10%; white-space: normal;'],
                "value" => function($model){
                    if(!empty($model->window_id)){
                            $rel = $model->window->getTypes($model->window_id)->one();
                        return $rel['type_name'];
                    }
                    else {
                        return "-";
                    }

                },
                "format" => "raw",
            ],
            [
                'attribute'=>'access_key_android',
                'contentOptions' => ['style' => 'width:10%; white-space: normal;'],
            ],
            [
                'attribute'=>'access_key_ios',
                'contentOptions' => ['style' => 'width:10%; white-space: normal;'],
            ],
            /*[
                'attribute' => 'window.screenshot.image',
                'format' => 'html',
                'value' => function($model) {
                    $str = "";
                    foreach($model->window->screenshot as $screen)
                    {
                        $str .= "<a href='../screenshot/view/".$screen->screenshot_id."'><img src='".Yii::getAlias('@image_path').$screen->image."' width='150'></a><br />";
                    }
                    return $str;
                }
            ],*/
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {create-translation} ',
                'buttons' => [
                    'create-translation' => function ($url) {
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
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
