<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;
//use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model backend\models\Translation */
/* @var $form yii\widgets\ActiveForm */
?>
<style>
    .control-label{ display : none;}
</style>

<div class="system-label-view">

    <h1><?= Html::encode($this->title) ?></h1>


    <div class="col-sm-12">
        <div class="col-sm-6">
                <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            [
                'label'=>'Screen window',
                'value'=>$window->window_name,
            ],
            [
                'label'=>'Type',
                'value'=>$type,
            ],
        ],
    ]);

    ?>
<div class="system-label-view">

<!--<h1>Add Translation</h1>-->
<div class="translation-form">
   <?php  /*echo Modal::begin([
    'header' => '<b>' . Yii::t('app', 'Create new project') . '</b>',
    'footer' => Html::submitButton(Yii::t('app', 'Save')),
    ]);*/ ?>

    <?php $form = ActiveForm::begin(); ?>

    <?php foreach ($systemLabel as $label) {

        $field = "translation_" . $label['label_id']; ?>

        <?php echo ('<label class="labels-bold">');
        echo "Label: </label><label class=\"labels-normal\">".$label['label'] ."</label>"; ?>


        <?php
        echo ('<br /><label class="translation-bold">Current Translation : </label><label class="translation-normal">');
        echo  (!empty($translation[$label['label_id']]['translation']) ? $translation[$label['label_id']]['translation'] :  "not available") .  " ( ". (!empty($translation[$label['label_id']]['created_by']) ? $translation[$label['label_id']]['created_by'] :  "not available") ." )" ."</label><br />" ; ?>
        <?= $form->field($model, $field)."<hr></hr>"; ?>

        <?php } ?>

    <div class="form-group">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>
    <?php //Modal::end(); ?>
    </div>
</div>
        </div>
        <div class="col-sm-6" id="no-scroll" style="text-align: center;">
            <?php
    foreach($screenshotData as $row)
    {
        echo ('<a href="javascript:void(0)" class="pop">');
        echo ('<img id='.$row['screenshot_id'].' src="'. Yii::getAlias('@image_path').$row['image'] .'" width="300" alt="view image " class="imgs_create_label"/>');
        echo ('</a>');
        echo "<br>";

    }?>
        </div>
    </div>