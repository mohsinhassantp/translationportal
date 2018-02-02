<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\Translation */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="system-label-view">

    <h1><?php //= Html::encode($this->title) ?></h1>

    <!--<p>
        <?/*= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->label_id], ['class' => 'btn btn-primary']) */?>
        <?/*= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->label_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) */?>
    </p>-->
    <?php foreach($screenshotData as $row)
    {
        echo ('<a href="javascript:void(0)" class="pop"><img src="'. Yii::getAlias('@image_path').$row['image'] .'" height="150" alt=" view image "/></a>');

    }  ?>

    <?= DetailView::widget([
        'model' => $systemLabel,
        'attributes' => [
            /*'label_id',*/
            'window.window_name',
            /*'window.type.type_name',*/
            // getting types value for 0, 1

            [
                'label'=>'Type Name',
                'value'=>$type,
            ],
            'access_key_android',
            'access_key_ios',
            'label',
            /*'created_at',
            'updated_at',*/
        ],
    ]);

    ?>
</div>
<h1>Add Translation</h1>
<div class="translation-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
    echo Html::hiddenInput('label_id', $systemLabel->label_id);
    /*echo $form->field($model, 'label_id')
        ->dropDownList(
            $labels,           // Flat array ('id'=>'label')
            ['prompt'=>'Please Select Label']    // options
        );*/ ?>
    <?php  /* echo $form->field($model, 'language_id')
        ->dropDownList(
            $languages,           // Flat array ('id'=>'label')
            ['prompt'=>'Please Select language']    // options
        ); */?>

    <?= $form->field($model, 'translation')->textInput(['maxlength' => true]) ?>

    <?php /*  echo $form->field($model, 'is_approved')
        ->dropDownList(
            array ('1'=> 'Active','0'=>'In-Active')
        ); */?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
