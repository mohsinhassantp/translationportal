<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\file\FileInput;


/* @var $this yii\web\View */
/* @var $model backend\models\ScreenWindow */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="screen-window-form">

    <?php //$form = ActiveForm::begin();
    $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'window_name')->textInput(['maxlength' => true]) ?>
    <?php   echo $form->field($model, 'type_id')
        ->dropDownList(
            $types,           // Flat array ('id'=>'label')
            ['prompt'=>'Please Select Type']    // options
        ); ?>
    <?php if(!$model->isNewRecord && (!empty($screenshotData) ) ) {

        //processing screenshot data

        foreach($screenshotData as $row)
        {
            echo ('<tabel border=2>
                    <tr><td><a href="javascript:void(0)" class="pop">
                    <img src="'. Yii::getAlias('@image_path').$row['image'] .'" height="150" alt=" view image "/></a>
                    </td></tr>
                    <tr><td><input type="checkbox" name="remove-image[]" value="'.$row['image'].'">Remove</td></tr>
                    </tabel>' );
        }
        // end of screenshot data

    }
    echo $form->field($model, 'image[]')->widget(FileInput::classname(), [
        'options'=>['accept'=>'image/*', 'multiple'=>true],
        'pluginOptions'=>['allowedFileExtensions'=>['jpg','gif','png']
        ]]);
    ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
