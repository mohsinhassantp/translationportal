<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Translation */

$this->title = Yii::t('app', 'Create Translation');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Translations'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="translation-create">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php /*
    foreach ($screenshotData as $row) {
        echo('<a href="../screenshot/view/' . $row['screenshot_id'] . '" alt=" Update Screenshot"><img src="' . Yii::getAlias('@image_path') . $row['image'] . '" height="150" alt=" view image "/></a>');

    }*/
    ?>

    <?= $this->render('_form', [
        'model' => $model,
        'systemLabel' => $systemLabel,
        'languages' => $languages,
        /*

        'window' => $window,
        'type' => $type,
        'screenshotData' => $screenshotData,*/
    ]) ?>

</div>
