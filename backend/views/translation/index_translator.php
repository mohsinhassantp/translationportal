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
        <?php //= Html::a(Yii::t('app', 'Create Translation'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "label_id",
                'contentOptions' => ['style' => 'width:40%; white-space: normal;'],
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
            /*[
                    "attribute" => "label.access_key_android",
                    'contentOptions' => ['style' => 'width:5%; white-space: normal;'],
                    "value" => "label.access_key_android",

            ],
            [
                "attribute" => "label.access_key_ios",
                'contentOptions' => ['style' => 'width:5%; white-space: normal;'],
                "value" => "label.access_key_ios",

            ],*/
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "created_by",
                'contentOptions' => ['style' => 'width:10%; white-space: normal;'],
                'filter' => ArrayHelper::map(\backend\models\User::find()->where(["language_id"=> \Yii::$app->session->get('languageId')])->orWhere(['or', ['role'=>30]])->orderBy('id')->asArray()->all(), 'id', 'username'),
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
                'contentOptions' => ['style' => 'width:10%; white-space: normal;'],
                'filter' => ['1'=>'Approved', '0'=>'Not Approved'],
                'format'=>'raw',
                'value' => function($model)
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
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "Type",
                "value" => function($model){
                    if(!empty($model->label->window_id)){
                        $rel = $model->label->window->getTypes($model->label->window_id)->one();
                        return $rel['type_name'];
                    }
                    else {
                        return "-";
                    }

                },
                "format" => "raw",
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{view} {update}',
            ],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
