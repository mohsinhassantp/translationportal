<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model backend\models\SystemLabel */

$this->title = $model->label_id;
if(\Yii::$app->session->get('role') == Yii::$app->params['SuperAdminRoleID']) {
    $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'System Labels'), 'url' => ['index']];
    $this->params['breadcrumbs'][] = $this->title;
}
?>
<div class="system-label-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?php foreach($screenshotData as $row)
    {
        echo ('<a href="javascript:void(0)" class="pop"><img src="'. Yii::getAlias('@image_path').$row['image'] .'" height="150" alt=" view image "/></a>');
    }
    ?>

    <p> <?php if(\Yii::$app->session->get('role') == Yii::$app->params['SuperAdminRoleID']){ ?>
        <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->label_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->label_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                'method' => 'post',
            ],
        ]) ?>
        <?php } ?>
    </p>

    <?php

    if(!empty($translationData))
    {
        /* echo '<h1>Translations</h1>';*/
        echo "<table id='w1' class='table table-striped table-bordered detail-view' ><tr></td></tr>";
        foreach($translationData as $row)
        {
            if($row['is_approved'])
            {
                echo '<tr><td width="10%"><label>Translation </label> </td><td width="40%"><b>'.$row['translation'].'</b></td>';
                echo '<td width="10%"><label> Created by</label>  </td><td><b>'.$row['username'].'</b></td></tr>';
            }
            else{
                echo '<tr><td width="10%"><label> Translation</label>  </td><td width="40%">'.$row['translation'].'</td>';
                echo '<td width="10%"><label> Created by</label>  </td><td>'.$row['username'].'</td></tr>';
            }

        }
        echo "</tabel>";
    }
    ?>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'label',
            'window.window_name',
            'access_key_android',
            'access_key_ios',
            [
                'label'=>'Type',
                'value'=>$type,
            ],
            'label_id',
        ],
    ]);

    ?>

</div>
