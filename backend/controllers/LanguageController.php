<?php

namespace backend\controllers;

use backend\models\Translation;
use Yii;
use backend\models\Language;
use backend\models\SearchLanguage;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\components\AccessRule;
use common\models\User;

/**
 * LanguageController implements the CRUD actions for Language model.
 */
class LanguageController extends Controller
{
    /**
     * @inheritdoc
     */
    /*public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }*/

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
            'access' => [
                'class' => AccessControl::className(),
                // We will override the default rule config with the new AccessRule class
                'ruleConfig' => [
                    'class' => AccessRule::className(),
                ],
                'only' => ['index','create', 'update', 'delete','import-ios','import-android'],
                'rules' => [
                    /*[
                        'actions' => ['create'],
                        'allow' => true,
                        // Allow users, moderators and admins to create
                        'roles' => [
                            User::STATUS_ACTIVE,
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],*/
                    /*[
                        'actions' => ['update'],
                        'allow' => true,
                        // Allow moderators and admins to update
                        'roles' => [
                            User::ROLE_MODERATOR,
                            User::ROLE_ADMIN
                        ],
                    ],*/
                    [
                        'actions' => ['index','create', 'update', 'delete','import-ios','import-android'],
                        'allow' => true,
                        // Allow admins to delete
                        'roles' => [
                            User::ROLE_ADMIN
                        ],
                    ],
                ],
            ],
            /*'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'users' => ['mohsin'],
                    ],
                ],
            ],*/
        ];
    }
    /**
     * Lists all Language data.
     * @return mixed
     */
    public function actionIndex()
    {

        //fetching database records
        $searchModel = new SearchLanguage();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        // else showing list view
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Language model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        // showing form
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Language model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Language();

        //checking if form posted then save data into database
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            \Yii::$app->getSession()->setFlash('success', 'Language created successfully.');
            return $this->redirect(['view', 'id' => $model->language_id]);
        } else {
            // else showing input form
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Language model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        //fetching perticular record from database
        $model = $this->findModel($id);

        //check if form submitted then save data into database
        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            //showin success message
            \Yii::$app->getSession()->setFlash('success', 'Language updated successfully.');
            //  showing view form
            return $this->redirect(['view', 'id' => $model->language_id]);
        } else {
            // else showing input form
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Language model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //fetching translation data as per language
        $translation = Translation::findOne(['language_id' => $id]); //->where->one();
        if(empty($translation)){
            //fetching perticular record
            $this->findModel($id)->delete();

            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('success', 'Language removed successfully.');
        }
        else {
            //showing success message and redirect to list page
            \Yii::$app->getSession()->setFlash('error', 'There are some translations available for this language, Delete them first to remove it');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the Language model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Language the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        //getting model if not available throw exception
        if (($model = Language::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    //Function to redirct another function available in system-labels
    public function actionImportIos()
    {
        return $this->redirect(['system-label/generate-translate-ios', 'id' => $_GET['id']]);
        //$this->redirect("system_label/GenerateTranslateIos/id=".$id);
    }

    //Function to redirct another function available in system-labels
    public function actionImportAndroid()
    {
        return $this->redirect(['system-label/generate-translate-android', 'id' => $_GET['id']]);
        //$this->redirect("system_label/GenerateTranslateIos/id=".$id);
    }
}
