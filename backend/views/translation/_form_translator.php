<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Translation */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="translation-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php   echo $form->field($model, 'label_id')
        ->dropDownList(
            $systemLabel,           // Flat array ('id'=>'label')
            ['prompt'=>'Please Select Label']    // options
        ); ?>

    <?= $form->field($model, 'translation')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
