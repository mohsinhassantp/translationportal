<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Translation */

$this->title = $model->translation_id;
if (\Yii::$app->session->get('role') == Yii::$app->params['SuperAdminRoleID']) {
    $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Translations'), 'url' => ['index']];
    $this->params['breadcrumbs'][] = $this->title;
}
?>
<div class="translation-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->translation_id], ['class' => 'btn btn-primary']) ?>
        <?php if (\Yii::$app->user->identity->isAdmin) {
            echo Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->translation_id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ]);
        } ?>
    </p>
    <?php
    foreach ($screenshotData as $row) {
        echo('<a href="javascript:void(0)" class="pop"><img src="' . Yii::getAlias('@image_path') . $row['image'] . '" height="150" alt=" view image "/></a>');

    }
    ?>
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'translation_id',
            'label.label',
            'translation',

            // getting is_approved value for 0, 1
            [
                'label' => 'is_approved',
                'value' => $model->getIsApproved($model->is_approved),
            ],

            'language.language_name',
            'user.username',
            'created_at',
        ],
    ]);

    ?>
</div>
