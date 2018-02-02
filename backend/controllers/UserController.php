<?php

namespace backend\controllers;

use backend\models\Translation;
use Yii;
use backend\models\User;
use backend\models\SearchUser;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use frontend\models\Language;

//use frontend\models\SignupForm;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
{
    /**
     * @inheritdoc
     */

    //this controller is no more used, commenting not required
    // default function for Yii
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        //setting data for user list view
        $searchModel = new SearchUser();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        //creating view for user list
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        //creating view for user detail
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        //create user instance
        $model = new User();

        //getting languages data
        $language = ArrayHelper::map(Language::find()->all(), 'language_id', 'language_name');

        //check if form posted
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        } else {
            //check if form is not posted then create input form
            return $this->render('create', [
                'model' => $model,
                'language' => $language,
            ]);
        }
    }


    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //getting record from database
        $model = $this->findModel($id);

        //check if form submitted
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('success', 'User updated successfully.');
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $translation = Translation::findOne(['user_id' => $id]); //->where->one();

        echo "<pre>";print_r($translation);exit;

        if(empty($translation)){

            //removing record from database
            $this->findModel($id)->delete();

            //setting success message
            \Yii::$app->getSession()->setFlash('success', 'User removed successfully.');
        }
        else {
            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('error', 'There are Translation available for this, Delete them first please');
        }

        return $this->redirect(['index']);

        //showing success message and redirect to list page
        /*\Yii::$app->getSession()->setFlash('success', 'User removed successfully.');
        return $this->redirect(['index']);*/
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //getting database table if not available throw exception
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
