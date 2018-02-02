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

$this->title = Yii::t('app', 'Windows');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="screen-window-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Screen Window'), ['create'], ['class' => 'btn btn-success']) ?>

    </p>
    <?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'window_id',
            'window_name',
            [
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "type_id",
                'filter' => ArrayHelper::map(Types::find()->orderBy('type_name')->asArray()->all(), 'type_id', 'type_name'),
                "value" => function($model){
                    if ($rel = $model->getTypes()->one()) {
                        return yii\helpers\Html::a($rel->type_name,["/types/view/", 'id' =>$rel->type_id],["data-pjax"=>0]);
                    } else {
                        return '';
                    }
                },
                "format" => "raw",
            ],
            /*[
                "class" => yii\grid\DataColumn::className(),
                "attribute" => "type_id",
                'filter' => ArrayHelper::map(Types::find()->orderBy('type_id')->asArray()->all(), 'type_id', 'type_name'),
                "value" => function($model){
                    if ($rel = $model->getTypes()->one()) {
                        return yii\helpers\Html::a($rel->type_name,["/types/".$rel->type_id, '' =>'' ,],["data-pjax"=>0]);
                    } else {
                        return '';
                    }
                },
                "format" => "raw",
            ],*/
            /*'created_at',*/
            /*[
                'attribute' => 'created_at',
                'format' => ['date', 'MMMM dd, YYYY HH:mm']
            ],*/
            [
                'attribute' => 'screenshot.image',
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>