<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\helpers\ArrayHelper;
use backend\models\SystemLabel;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\SearchTranslation */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Translations');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="translation-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Translation'), ['create'], ['class' => 'btn btn-success']) ?>
        <button name="check-all" id="approve-all" value="checkall" class="btn btn-primary">Approve All</button>
        <button name="check-all" id="disapprove-all" value="checkall" class="btn btn-danger">Disapprove All</button>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                'class' => 'yii\grid\CheckboxColumn',
                'name' => 'translation_id'
            ],
            [
                "class" => yii\grid\DataColumn::className(),
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
                "attribute" => "label_id",
                'filter' => ArrayHelper::map(SystemLabel::find()->orderBy('label')->asArray()->all(), 'label_id', 'label'),
                "value" => function($model){
                    if ($rel = $model->getLabel()->one()) {
                        return yii\helpers\Html::a($rel->label,["/system-label/view/", 'id' =>$rel->label_id],["data-pjax"=>0]);
                    } else {
                        return '';
                    }
                },
                "format" => "raw",
            ],
            [
                'attribute'=>'translation',
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
            ],
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "language_id",
                'filter' => ArrayHelper::map(\backend\models\Language::find()->orderBy('language_id')->asArray()->all(), 'language_id', 'language_name'),
                "value" => function($model){
                    if ($rel = $model->getLanguage()->one()) {
                        return yii\helpers\Html::a($rel->language_name,["/language/view/", 'id' =>$rel->language_id],["data-pjax"=>0]);
                    } else {
                        return '';
                    }
                },
                "format" => "raw",
            ],
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "created_by",
                'filter' => ArrayHelper::map(\backend\models\User::find()->orderBy('id')->asArray()->all(), 'id', 'username'),
                "value" => function($model){
                    if ($rel = $model->getUser()->one()) {
                        return ucfirst($rel->username);
                    } else {
                        return '';
                    }
                },
                "format" => "raw",
            ],
            [
                'attribute'=>'is_approved',
                'header'=>'Status',
                'filter' => ['1'=>'Approved', '0'=>'Not Approved'],
                'format'=>'raw',
                'value' => function($model, $key, $index)
                {
                    if($model->is_approved == '1')
                    {
                        return '<button class="btn btn-primary">Approved</button>';
                    }
                    else
                    {
                        return '<button class="btn btn-danger">Not Approved</button>';
                    }
                },
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update} {delete}',
                'buttons' => [
                    'toggle-approve' => function ($url) {
                        return Html::a(
                            '<span class="glyphicon glyphicon-check" style="padding-left:2px;"></span>',
                            $url,
                            [
                                'title' => 'Approve/Not-approve',
                                'data-pjax' => '0',
                            ]
                        );
                    },
                ],
            ],

            /*['class' => 'yii\grid\ActionColumn'],*/
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
<?php
$this->registerJs('
    $(\'#approve-all\').click(function (){
        var keylist = [];
        keylist = keylist.concat($(\'.grid-view\').yiiGridView(\'getSelectedRows\'));
        // select all rows on page 1, go to page 2 and select all rows.
        // All rows on page 1 and 2 will be selected.
        //console.log(JSON.stringify(keylist));
        keylist = "\""+keylist+"\"";
        
        $.post({
        url: \'approveall\', // your controller action
            dataType: \'json\',
            method: \'GET\',
            data: {keylist : keylist},
            success: function (data, textStatus, jqXHR) {            
                $("#w0").yiiGridView("applyFilter");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //alert(\'error\'+textStatus);
            }
       });
});

$(\'#disapprove-all\').click(function (){
        var keylist = [];
        keylist = keylist.concat($(\'.grid-view\').yiiGridView(\'getSelectedRows\'));
        // select all rows on page 1, go to page 2 and select all rows.
        // All rows on page 1 and 2 will be selected.
        //console.log(JSON.stringify(keylist));
        keylist = "\""+keylist+"\"";
        
        $.post({
        url: \'disapproveall\', // your controller action
            dataType: \'json\',
            method: \'GET\',
            data: {keylist : keylist},
            success: function (data, textStatus, jqXHR) {
                $("#w0").yiiGridView("applyFilter");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //alert(\'error\'+textStatus);
            }
       });
});');
?>