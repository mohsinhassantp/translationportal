<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * SearchScreenWindow represents the model behind the search form about `backend\models\ScreenWindow`.
 */
class SearchScreenWindow extends ScreenWindow
{
    public $image;
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['window_id','type_id'], 'integer'],
            [['window_name', 'type_id', 'created_at','image'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }
    //getting screen shots relation data
    public function getScreenshot()
    {
        return $this->hasMany(Screenshot::className(), ['screen_windows_id' => 'window_id']);
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */

    public function search($params)
    {
        $query = ScreenWindow::find();
       // $query->leftJoin("screenshot","screen_window_id","window_id");
        //$query->leftJoin("screenshots","screen_window_id = window_id");
       // '`order`.`customer_id` = `customer`.`id`'
        // $query->joinWith("screenshot");
        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort'=> ['defaultOrder' => ['window_id' => SORT_ASC]]
        ]);

        $this->load($params);

        if (!$this->validate()) {
            return $dataProvider;
        }

        /*if ($this->created_at !== null) {
            $date = strtotime($this->created_at);
            $query->andFilterWhere(['between', 'screen_windows.created_at', $date, $date + 3600 * 24]);
        }*/

        // grid filtering conditions
        $query->andFilterWhere([
            'screen_windows.window_id' => $this->window_id,
            /*'screen_windows.created_at' => $this->created_at,*/
        ]);


        $query->andFilterWhere(['like', 'window_name', $this->window_name])
            ->andFilterWhere(['like', 'type_id', $this->type_id])
            //->andFilterWhere(['like', 'screenshots.window_id', $this->window_id])
            ->andFilterWhere(['like', 'screen_windows.created_at', $this->created_at]);


        return $dataProvider;
    }
}
