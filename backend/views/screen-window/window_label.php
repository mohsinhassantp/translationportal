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
    <?php Pjax::begin(); ?><?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'window_id',
            'window_name',
            [
                'attribute' => 'labels',
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
                'format' => 'html',
                'value' => function ($model) {
                    $str = "";
                    foreach ($model->label as $lab) {
                        $str .= "- <a href='../system-label/view?id=" . $lab->label_id . "'>" . $lab->label . "</a> <br />";
                    }
                    return $str;
                }
            ],
            /*[
                'attribute' => 'Status',
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
                'format' => 'html',
                'value' => function ($model) {
                    $str = '<span class="btn btn-primary" style="padding-left:5px;">COMPLETE</span>';
                    foreach ($model->label as $lab) {
                        $translation = \backend\models\Translation::find()->where(['label_id'=> $lab->label_id , "is_approved" => 1 , "language_id" => 4])->one();
                        if(empty($translation['translation']))
                        {
                            $str = '<span class="btn btn-danger" style="padding-left:5px;">INCOMPLETE</span>';
                        }
                        //echo $translation['translation'];
                    }
                    return $str;
                }
            ],*/
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
            /*[<a href='../screenshot/view/".$screen->screenshot_id."'>
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
            ],*/
            /*'created_at',*/


            /*['class' => 'yii\grid\ActionColumn'],*/
        ],
    ]); ?>
    <?php Pjax::end(); ?></div>

<!--<div class="col-sm-12 prog-bar">
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
</div>-->
