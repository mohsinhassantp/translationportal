<?php

namespace frontend\models;

use Yii;

/**
 * This is the model class for table "languages".
 *
 * @property string $language_id
 * @property string $language_name
 * @property string $created_at
 */
class Language extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'languages';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
           /* [['created_at'], 'safe'],*/
            [['language_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'language_id' => Yii::t('app', 'Language ID'),
            'language_name' => Yii::t('app', 'Language Name'),
            /*'created_at' => Yii::t('app', 'Created At'),*/
        ];
    }
}
