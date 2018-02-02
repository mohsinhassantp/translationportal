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
    <?php   echo $form->field($model, 'language_id')
        ->dropDownList(
            $languages,           // Flat array ('id'=>'label')
            ['prompt'=>'Please Select language']    // options
        ); ?>

    <?= $form->field($model, 'translation')->textInput(['maxlength' => true]) ?>

    <?php   echo $form->field($model, 'is_approved')
        ->dropDownList(
            array ('1'=> 'Approved','0'=>'Not-Approved')
        /*['prompt'=>'Please Select language']*/    // options
        ); ?>

    <?php //= $form->field($model, 'created_by')->textInput(['maxlength' => true]) ?>

    <?php //= $form->field($model, 'created_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
