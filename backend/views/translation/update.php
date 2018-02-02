<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Translation */

$this->title = Yii::t('app', 'Update {modelClass}: ', [
    'modelClass' => 'Translation',
]) . $model->translation_id;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Translations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->translation_id, 'url' => ['view', 'id' => $model->translation_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="translation-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php
    foreach ($screenshotData as $row) {
        echo('<a href="javascript:void(0)" class="pop"><img src="' . Yii::getAlias('@image_path') . $row['image'] . '" height="150" alt=" view image "/></a>');

    }
    ?>

    <?= $this->render('_form', [
        'model' => $model,
        'systemLabel' => $systemLabel,
        'languages' => $languages,
        /*'systemLabel' => $systemLabel,
        'window' => $window,
        'type' => $type,
        'screenshotData' => $screenshotData,*/
    ]) ?>

</div>
